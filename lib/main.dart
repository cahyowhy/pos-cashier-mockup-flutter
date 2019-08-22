import 'package:flutter/material.dart';
import 'package:padi_pos_kasir/screen/cashier.dart';
import 'package:padi_pos_kasir/screen/cek_printer.dart';
import 'package:padi_pos_kasir/screen/detail_order.dart';

import 'model/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(debugLabel: "main_home");

  Widget _makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    return _buildRoute(
        context: context, routeName: routeName, arguments: arguments);
  }

  void openDrawer() {
    // this._scaffoldKey.currentState.openDrawer();
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case '/':
        return CashierScreen(this.openDrawer);
      case '/cek-printer':
        return CekPrinter();
      case '/order-detail':
        List<Order> pesanans = (arguments as List<Order>);

        return DetailOrderScreen(pesanans: pesanans);
      default:
        throw 'Route $routeName is not defined';
    }
  }

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
          builder: (BuildContext context) {
            return Scaffold(
                // key: _scaffoldKey,
                drawer: Drawer(
                    // Add a ListView to the drawer. This ensures the user can scroll
                    // through the options in the drawer if there isn't enough vertical
                    // space to fit everything.
                    child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )),
                body: _makeRoute(
                  context: context,
                  routeName: settings.name,
                  arguments: settings.arguments,
                ));
          },
          maintainState: true,
          fullscreenDialog: false,
        );
      },
    );
  }
}
