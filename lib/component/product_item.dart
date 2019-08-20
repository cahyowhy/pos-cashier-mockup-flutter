import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';

class ProductItem extends StatelessWidget {
  String image = "";
  bool displayImage = true;
  Widget child = SizedBox(width: 0, height: 0);

  final void Function() _fnAdd;
  final String _name;
  final int _price;
  final int _rating;
  final bool _hasPromo;

  ProductItem(
      this._fnAdd, this._name, this._price, this._rating, this._hasPromo,
      {Key key, this.image = "", this.displayImage = true, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: _fnAdd,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  displayImage
                      ? Container(
                          margin: EdgeInsets.only(right: 12.0),
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: _rating > 3
                              ? Stack(children: <Widget>[
                                  SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(6))),
                                          child: SvgPicture.asset(
                                              "assets/images/star.svg")))
                                ])
                              : Container(),
                        )
                      : SizedBox(width: 0, height: 0),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("$_name",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Row(
                                children: <Widget>[
                                  Text(formatCurrency(_price),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                                  _hasPromo
                                      ? Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                            ),
                                            Container(
                                              width: 6,
                                              height: 6,
                                              decoration: BoxDecoration(
                                                  color: Colors.black38,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                            ),
                                            SvgPicture.asset(
                                                "assets/images/coupon.svg",
                                                width: 14,
                                                height: 14)
                                          ],
                                        )
                                      : SizedBox(height: 0, width: 0)
                                ],
                              )
                            ]),
                      )),
                  child
                ],
              ),
            )));
  }
}
