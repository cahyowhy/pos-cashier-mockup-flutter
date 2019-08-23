import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/widgets.dart';
import 'package:padi_pos_kasir/component/counter.dart';
import 'package:padi_pos_kasir/component/product_item.dart';
import 'package:padi_pos_kasir/model/order.dart';
import 'package:padi_pos_kasir/model/product.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';

class DetailOrderScreen extends StatefulWidget {
  final List<Order> _pesanans;

  DetailOrderScreen({@required pesanans}) : _pesanans = pesanans;

  @override
  _DetailState createState() => _DetailState(_pesanans);
}

class _DetailState extends State<DetailOrderScreen>
    with SingleTickerProviderStateMixin {
  final _payCashTextController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');
  

  int _cash = 0;
  
  
  
  TabController _controller;
  
  List<Order> _pesanans = [];
  List<String> _serviceTypes = ["Cash", "GOPAY", "LAINYA"];

  _DetailState(this._pesanans);

  Map<String, dynamic> _detailPesanans() {
    Map<String, dynamic> details = {"item": 0, "total": 0, "order": 0};

    details["order"] = _pesanans.length;

    _pesanans.forEach((Order o) {
      details["item"] += o.total;
      details["total"] += o.total * o.product.price;
    });

    return details;
  }

  @override
  void initState() {
    _controller = new TabController(vsync: this, length: _serviceTypes.length);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _sizedBoxButton(Widget child, {double width}) {
    return SizedBox(
      width: width,
      height: 50,
      child: child,
    );
  }

  Widget _renderChargeSuggest() {
    List<int> chargeSuggest = _chargeSuggestion(_detailPesanans()["total"]);
    List<Widget> widgets = [];
    int i = 0;

    if (chargeSuggest.length > 0) {
      chargeSuggest.forEach((charge) {
        widgets.add(_sizedBoxButton(RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(6)),
            child: Text(
              formatCurrency(charge),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            color: Colors.orange,
            onPressed: () {
              setState(() {
                _cash = charge;
                _payCashTextController.updateValue(charge.toDouble());
              });
            })));

        if (i < chargeSuggest.length - 1) {
          widgets.add(SizedBox(width: 8));
        }

        i++;
      });

      return Padding(
          child: SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widgets,
            ),
          ),
          padding: EdgeInsets.only(bottom: 16));
    }

    return SizedBox(width: 0, height: 0);
  }

  Widget _paddingBottom(Widget child, {double bottom = 12}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: child,
    );
  }

  void _showConfirmCharge(String price, String metode) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Wrap(
              children: <Widget>[
                _paddingBottom(Text(
                  "Konfirmasi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
                _paddingBottom(Text(
                    "Anda akan menyelesaikan pesanan dengan nilai transaksi sebesar $price. Dengan metode $metode ?")),
                Row(children: <Widget>[
                  Expanded(
                      child: _sizedBoxButton(RaisedButton(
                    color: Color(0xff3500a0),
                    child: Text(
                      "YA",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showChargeSuccess(price, metode);
                    },
                  ))),
                  SizedBox(width: 8),
                  Expanded(
                      child: _sizedBoxButton(OutlineButton(
                    color: Colors.black45,
                    child: Text("TIDAK"),
                    onPressed: () => Navigator.of(context).pop(),
                  ))),
                ])
              ],
            ),
          );
        });
  }

  List<int> _chargeSuggestion(int value) {
    List<int> moneyFracs = [2000, 5000, 10000, 20000];

    int multiplier(int fracs) {
      int vals = (value / fracs).round() * fracs;

      if (vals < value) {
        vals += fracs;
      }

      return vals;
    }

    List<int> suggest = [];

    if (value <= 10000) {
      return [10000];
    }

    if (value >= 100000 && value <= 1000000) {
      moneyFracs.add(50000);
    }

    if (value > 1000000) {
      moneyFracs.add(50000);
      moneyFracs.add(100000);
    }

    moneyFracs.forEach((m) => suggest.add(multiplier(m)));

    return suggest.toSet().toList();
  }

  List<Widget> _buildDetailOrder() {
    String totalPrice = formatCurrency(_detailPesanans()["total"]);
    List<Widget> widgets = [
      Padding(
          padding: EdgeInsets.only(right: 12, left: 12, top: 24),
          child:
              Text("Detail Pesanan", style: TextStyle(color: Colors.black45)))
    ];

    _pesanans.forEach((Order o) {
      Product product = o.product;
      String name = o.product.name;
      String total = o.total.toString();
      int price = o.product.price;
      int rating = o.product.rating;
      bool hasPromo = o.product.hasPromo;

      void Function() fnAdd = () => _onAddPesanans(product);
      void Function() fnMinus = () => _onRemovePesanans(product);

      widgets.add(ProductItem(fnAdd, name, price, rating, hasPromo,
          displayImage: false, child: Counter(fnAdd, fnMinus, total)));
    });

    widgets.add(Padding(
        padding: EdgeInsets.only(right: 12, left: 12, top: 20),
        child:
            Text("Total Pembayaran", style: TextStyle(color: Colors.black45))));
    widgets.add(Padding(
        padding: EdgeInsets.only(right: 12, left: 12, top: 12),
        child: Row(children: <Widget>[
          Expanded(
              child: Text("Subtotal",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
          Text(totalPrice)
        ])));

    List<Tab> tabs = [];
    List<Widget> tabContents = [];

    int cashReturn = _cash - _detailPesanans()["total"];
    String cashReturnFmt = formatCurrency(cashReturn.abs());

    if (cashReturn < 0) cashReturnFmt = "($cashReturnFmt)";

    Widget payCash = Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Row(children: <Widget>[
            Expanded(
                child: Text("Kembalian",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
              child: Text(
                cashReturnFmt,
                style: TextStyle(color: Colors.white),
              ),
            )
          ])),
      Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: TextField(
            autofocus: true,
            style: TextStyle(
                fontSize: 20, height: 1.15, fontWeight: FontWeight.w500),
            onChanged: (val) {
              setState(() {
                _cash = _payCashTextController.numberValue.toInt();
              });
            },
            keyboardType: TextInputType.number,
            controller: _payCashTextController,
          )),
      _renderChargeSuggest(),
      Row(children: <Widget>[
        Expanded(
            child: _sizedBoxButton(RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(6)),
                color: Color(0xff3500a0),
                onPressed: () {
                  if (_cash < _detailPesanans()["total"]) {
                    _showConfirmAlertDialog(
                        "Peringatan !!", "Nominal yang anda masukkan Salah",
                        actions: []);
                  } else {
                    _showConfirmCharge(formatCurrency(_cash), "cash");
                  }
                },
                child: Text(
                  "Bayar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )))),
        SizedBox(width: 8),
        _sizedBoxButton(
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(6)),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                color: Colors.red,
                onPressed: _onRemoveAllPesanan),
            width: 60)
      ])
    ]);

    _serviceTypes.forEach((s) {
      tabs.add(Tab(text: s.toUpperCase()));
    });

    tabContents.add(payCash);
    tabContents.add(Text("cek"));
    tabContents.add(Text("cek"));

    widgets.add(Container(
      child: Column(children: [
        TabBar(
            tabs: tabs,
            indicatorWeight: 3,
            controller: _controller,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            unselectedLabelColor: Colors.black38),
        Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: TabBarView(children: tabContents, controller: _controller),
            height: 250)
      ]),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 28),
    ));
    return widgets;
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
        _pesanans.add(Order(total: 1, product: p));
      }
    });
  }

  void _showChargeSuccess(String price, String metode) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material(
              child: Container(
            padding: EdgeInsets.all(16),
            child: Stack(children: <Widget>[
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _paddingBottom(
                          Icon(Icons.check_circle,
                              size: 100, color: Colors.white),
                          bottom: 35),
                      _paddingBottom(
                          Text(
                            "Pesanan telah selesai",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          bottom: 12),
                      _paddingBottom(
                          Text("Silahkan cek daftar pembayaran $metode Anda",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0)),
                          bottom: 30),
                      _paddingBottom(
                          Text("Total Pembayaran",
                              style: TextStyle(color: Colors.white)),
                          bottom: 4),
                      _paddingBottom(
                          Text(price,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26)),
                          bottom: 30),
                      Column(
                        children: <Widget>[
                          _sizedBoxButton(
                              RaisedButton(
                                color: Colors.white,
                                child: Text(
                                  "Cetak Receipt",
                                ),
                                onPressed: () {},
                              ),
                              width: double.infinity),
                          SizedBox(height: 12),
                          _sizedBoxButton(
                              RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Email Receipt",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                              width: double.infinity)
                        ],
                      ),
                    ]),
              ),
              IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop())
            ]),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Color(0xff3500a0)])),
          ));
        });
  }

  void _showConfirmAlertDialog(String title, String content,
      {List<Widget> actions}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: [
            ...actions,
            new FlatButton(
              child: new Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _onRemoveAllPesanan() {
    _showConfirmAlertDialog(
        "Hapus Pesanan ?", "Anda Yakin akan membatalkan pesanan",
        actions: [
          new RaisedButton(
            color: Colors.red,
            child: new Text(
              "Hapus",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _pesanans.clear();
              Navigator.of(context).pushNamed('/');
            },
          )
        ]);
  }

  void _onRemovePesanans(Product p, {bool forceRemove = false}) {
    if (_detailPesanans()["item"] == 1 && !forceRemove) {
      _onRemoveAllPesanan();
    } else {
      setState(() {
        int idxAt = _pesanans.indexWhere((Order o) => o.product.guid == p.guid);

        if (idxAt != -1 && _pesanans[idxAt].total > 1) {
          _pesanans[idxAt].total -= 1;
        } else {
          _pesanans.removeAt(idxAt);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: _buildDetailOrder()),
      appBar: AppBar(
          title: Row(children: <Widget>[
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Text('Pesanan',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 28))),
                IconButton(
                  icon: Icon(Icons.receipt),
                  onPressed: () {},
                )
              ]),
        ),
      ])),
    );
  }
}
