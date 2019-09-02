import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padi_pos_kasir/style/style.dart';

class CommonButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  Color color;
  Color textColor;
  bool loading;

  CommonButton(
      {Key key,
      this.onPressed,
      this.child,
      this.loading = false,
      this.color = CommonStyle.primary,
      this.textColor = CommonStyle.primaryText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textTheme: ButtonTheme.of(context).textTheme,
      child: loading
          ? SizedBox(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
              height: 18,
              width: 18)
          : child,
      color: color,
      textColor: textColor,
      onPressed: onPressed,
    );
  }
}
