import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonStyle {
  static const Color primary = Color(0xff334556);

  static const Color primaryLight = Color(0xff5e7083);

  static const Color primaryDark = Color(0xff0a1e2d);

  static const Color primaryText = Color(0xffffffff);

  static const Color secondary = Color(0xffffb134);

  static const Color secondaryLight = Color(0xffffe367);

  static const Color secondaryDark = Color(0xffc78200);

  static const Color secondaryText = Color(0xff000000);

  static const Color danger = Color(0xffFF3860);
  
  static const Color info = Color(0xff209CEE);
  
  static const Color success = Color(0xff23D160);

  static Widget paddingWrapper(Widget child,
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: child);
  }

  static ThemeData theme = ThemeData(
      textTheme: TextTheme().apply(fontFamily: 'Source Sans Pro'),
      primaryColor: CommonStyle.primary,
      primaryColorLight: CommonStyle.primaryLight,
      primaryColorDark: CommonStyle.primaryDark,
      accentColor: CommonStyle.secondary,
      fontFamily: 'Source Sans Pro',
      accentTextTheme:
          TextTheme().apply(displayColor: CommonStyle.secondaryText),
      primaryTextTheme:
          TextTheme().apply(displayColor: CommonStyle.primaryText));
}
