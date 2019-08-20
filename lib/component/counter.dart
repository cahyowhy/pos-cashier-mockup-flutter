import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final void Function() _fnAdd;
  final void Function() _fnMinus;
  final String _total;

  const Counter(this._fnAdd, this._fnMinus, this._total, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(6.0))),
        child: Row(
          children: <Widget>[
            SizedBox(
                height: 35,
                width: 35,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.add, size: 22, color: Colors.green),
                  onPressed: _fnAdd,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(_total,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            SizedBox(
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.remove, size: 22, color: Colors.red),
                  onPressed: _fnMinus,
                ),
                height: 35,
                width: 35)
          ],
        ));
  }
}
