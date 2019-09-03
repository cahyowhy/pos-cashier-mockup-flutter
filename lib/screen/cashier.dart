import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padi_pos_kasir/component/counter.dart';
import 'package:padi_pos_kasir/component/drawer.dart';
import 'package:padi_pos_kasir/component/product_item.dart';
import 'package:padi_pos_kasir/model/order.dart';
import 'package:padi_pos_kasir/model/product.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';

class _ProductScreen {
  String category = "";
  List<Product> products = [];

  _ProductScreen({this.category, this.products});
}
class CashierScreen extends StatefulWidget {

  CashierScreen({Key key}) : super(key: key);

  @override
  _CashierState createState() => _CashierState();
}

class _CashierState extends State<CashierScreen> {
  List<Product> _products = Product.fakerizes(total: 12);
  List<Order> _pesanans = [];

  List<_ProductScreen> _productDatas() {
    if (_products.length == 0) {
      return [];
    }

    List<_ProductScreen> productScreens = [];

    _products.forEach((p) {
      int idx = productScreens.indexWhere(
          (_ProductScreen pc) => pc.category == p.productCategory.name);

      if (idx != -1) {
        productScreens[idx].products.add(p);
      } else {
        productScreens.add(
            _ProductScreen(category: p.productCategory.name, products: []));
        productScreens[productScreens.length - 1].products.add(p);
      }
    });

    return productScreens;
  }

  Map<String, dynamic> _detailPesanans() {
    Map<String, dynamic> details = {"item": 0, "total": 0, "order": 0};

    details["order"] = _pesanans.length;

    _pesanans.forEach((Order o) {
      details["item"] += o.total;
      details["total"] += o.total * o.product.price;
    });

    return details;
  }

  void _onAddPesanans(Product p) {
    bool hasProduct = false;
    setState(() {
      int i = 0;

      _pesanans.forEach((Order o) {
        if (o.product.guid == p.guid) {
          _pesanans[i].total += 1;
          hasProduct = true;

          return;
        }

        i++;
      });

      if (!hasProduct) {
        var order = Order(total: 1);
        order.product = p;

        _pesanans.add(order);
      }
    });
  }

  void _onRemovePesanans(Product p) {
    setState(() {
      int idxAt = _pesanans.indexWhere((Order o) => o.product.guid == p.guid);

      if (idxAt != -1 && _pesanans[idxAt].total > 1) {
        _pesanans[idxAt].total -= 1;
      } else {
        _pesanans.removeAt(idxAt);
      }
    });
  }

  Widget _renderProductCounted(Product p) {
    int idx = _pesanans.indexWhere((Order od) => od.product.guid == p.guid);

    if (idx != -1) {
      return Counter(() => _onAddPesanans(p), () => _onRemovePesanans(p),
          _pesanans[idx].total.toString());
    }

    return SizedBox(width: 0, height: 0);
  }

  Widget _renderInfoOrder() {
    return _detailPesanans()["item"] > 0
        ? Material(
            child: InkWell(
                onTap: () => Navigator.of(context)
                    .pushNamed('Order Detail', arguments: _pesanans),
                child: Container(
                    height: 68,
                    padding: EdgeInsets.all(8),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: new Offset(2, 2),
                              )
                            ],
                            color: Color(0xff3500a0),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Row(
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Items",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    _detailPesanans()["item"].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ]),
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              width: 1,
                              margin: EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                  Text(
                                    "SubTotal",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    formatCurrency(_detailPesanans()["total"]),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ])),
                            IconButton(
                                icon: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                                onPressed: () {})
                          ],
                        )))))
        : SizedBox(height: 0, width: 0);
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [];
    List<_ProductScreen> productDatas = _productDatas();

    productDatas.forEach((p) => tabs.add(Tab(
        child: Text(p.category.toUpperCase(),
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)))));

    List<Widget> _buildProductList() {
      List<Widget> listviews = [];

      productDatas.forEach((p) {
        int length = p.products.length;
        listviews.add(Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: length,
              key: Key(p.category),
              itemBuilder: (BuildContext context, int index) {
                Product currentProduct = p.products[index];
                String name = currentProduct.name;
                String image = currentProduct.image;
                int price = currentProduct.price;
                int rating = currentProduct.rating;
                bool hasPromo = currentProduct.hasPromo;
                Widget productItem = ProductItem(
                    () => _onAddPesanans(currentProduct),
                    name,
                    price,
                    rating,
                    hasPromo,
                    image: image,
                    child: _renderProductCounted(currentProduct));

                return index == length - 1
                    ? Column(
                        children: <Widget>[productItem, SizedBox(height: 68)])
                    : productItem;
              },
            )));
      });

      return listviews;
    }

    return DefaultTabController(
      length: productDatas.length,
      child: Scaffold(
        drawer: CommonDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (BuildContext ctx) {
            return SizedBox(
                height: 28,
                width: 28,
                child: IconButton(
                  padding: new EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.menu,
                    size: 28,
                  ),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                ));
          }),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs,
          ),
          title: Row(
            children: <Widget>[
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Text('Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 28))
                  ])),
              Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 8.0, left: 32.0),
                      child: Text(
                          _detailPesanans()["order"].toString() + " Pesanan",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(
                          color: Color(0xfffcf3f3),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border:
                              Border.all(width: 2, color: Color(0xfff7e9e7)))),
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xffae000d),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.notifications, size: 14))
                ],
              )
            ],
          ),
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          TabBarView(
            children: _buildProductList(),
          ),
          _renderInfoOrder(),
        ]),
      ),
    );
  }
}
