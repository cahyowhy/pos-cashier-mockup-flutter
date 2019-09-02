// import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:padi_pos_kasir/common/socket.dart';
import 'package:padi_pos_kasir/screen/cashier.dart';
import 'package:padi_pos_kasir/screen/cek_printer.dart';
import 'package:padi_pos_kasir/screen/detail_order.dart';
import 'package:padi_pos_kasir/screen/login.dart';
import 'package:padi_pos_kasir/screen/product_category_screen.dart';
import 'package:padi_pos_kasir/style/style.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

import 'model/order.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    return _buildRoute(
        context: context, routeName: routeName, arguments: arguments);
  }

  @override
  void initState() {
    // _consumeSocket();
    super.initState();
  }

  void _consumeSocket() {
    Socket.listenMessage((message) {
      LogUtil.print(message.toString() + " from MAIN");
    });

    Socket.subscribe('/topic/client/info/a2cf3368ae8e4f20aa0e0047e7c5ef59');
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case 'Login':
        return LoginScreen();
      case 'Cashier':
        return CashierScreen();
      case 'Printer':
        return CekPrinter();
      case 'ProductCategory':
        return ProductCategoryScreen();
      case 'Order Detail':
        List<Order> pesanans = (arguments as List<Order>);

        return DetailOrderScreen(pesanans: pesanans);
      default:
        throw 'Route $routeName is not defined';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padi Kasir',
      debugShowCheckedModeBanner: false,
      theme: CommonStyle.theme,
      initialRoute: 'Login',
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return _makeRoute(
              context: context,
              routeName: setting.name,
              arguments: setting.arguments,
            );
          },
          maintainState: true,
          fullscreenDialog: false,
        );
      },
    );
  }
}
