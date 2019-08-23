import 'dart:io';

import 'package:flutter/material.dart';
import 'package:padi_pos_kasir/screen/cashier.dart';
import 'package:padi_pos_kasir/screen/cek_printer.dart';
import 'package:padi_pos_kasir/screen/detail_order.dart';
import 'package:padi_pos_kasir/service/socket.dart';

import 'model/order.dart';

void main() => runApp(MyApp());

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
    _consumeSocket();

    // try {
    //   InternetAddress.lookup('192.168.0.137').then((result) {
    //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //       print('connected');
    //     }
    //   });
    // } on SocketException catch (_) {
    //   print('not connected');
    // }

    super.initState();
  }

  void _consumeSocket() {
    Socket.listenMessage((message) {
      debugPrint(message.toString() + " from MAIN");
    });

    Socket.subscribe('/topic/client/info/a2cf3368ae8e4f20aa0e0047e7c5ef59');
  }

  Widget _buildRoute({
    @required BuildContext context,
    @required String routeName,
    Object arguments,
  }) {
    switch (routeName) {
      case 'Cashier':
        return CashierScreen();
      case 'Printer':
        return CekPrinter();
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
      title: 'Padi Kasir Custom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'Cashier',
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
