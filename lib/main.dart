import 'package:flutter/material.dart';
import 'package:padi_pos_kasir/screen/cashier.dart';
import 'package:padi_pos_kasir/screen/detail_order.dart';

import 'model/order.dart';

void main() => runApp(MyApp());

Widget makeRoute(
    {@required BuildContext context,
    @required String routeName,
    Object arguments}) {
  final Widget child =
      _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
}) {
  switch (routeName) {
    case '/':
      return CashierScreen();
    case '/order-detail':
      List<Order> pesanans = (arguments as List<Order>);

      return DetailOrderScreen(pesanans: pesanans);
    default:
      throw 'Route $routeName is not defined';
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padi Kasir Custom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => makeRoute(
                context: context,
                routeName: settings.name,
                arguments: settings.arguments,
              ),
          maintainState: true,
          fullscreenDialog: false,
        );
      },
    );
  }
}
