import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

class CekPrinter extends StatefulWidget {
  @override
  _CekPrinterState createState() => _CekPrinterState();
}

class _CekPrinterState extends State<CekPrinter> {
  BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
  bool _bluetoothConnected = false;
  bool _bluetoothPressed = false;
  BluetoothDevice _device;
  List<BluetoothDevice> _devices = [];

  @override
  void initState() {
    _initPlatformState();

    super.initState();
  }

  void _showSnackBar(String text) {
    if (context != null) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(text),
      ));
    }
  }

  Future<dynamic> _getBoundedDevices() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException catch (e) {
      LogUtil.print(e.toString());
      Future.delayed(Duration.zero).then((val) {
        _showSnackBar("Gagal mendapatkan perangkat terhubung");
      });
    }

    return devices;
  }

  _initPlatformState() {
    _getBoundedDevices().then((devices) {
      _setDevices(devices);
    });

    _bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _bluetoothConnected = true;
            _bluetoothPressed = false;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _bluetoothConnected = false;
            _bluetoothPressed = false;
          });
          break;
        default:
          break;
      }

      _getBoundedDevices().then((devices) {
        _setDevices(devices);
      });
    });
  }

  void _setDevices(devices) {
    setState(() {
      _devices = devices;

      if (_devices.length == 0) {
        _showSnackBar('Tidak ada perangkat terpasang yang tersedia');
      }
    });
  }

  Future<void> _disconnectBluetooth() async {
    await _bluetooth
        .disconnect()
        .then((param) => setState(() => _bluetoothPressed = true));
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((BluetoothDevice device) {
        String deviceName = device.name;
        if (deviceName == null) deviceName = "null";

        items.add(DropdownMenuItem(
          child: Text(deviceName),
          value: device,
        ));
      });
    }

    return items;
  }

  void _tesPrint() async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    _bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        // _bluetooth.printCustom("HEADER", 3, 1);
        _bluetooth.printNewLine();
        // _bluetooth.printNewLine();
        // _bluetooth.printLeftRight("LEFT", "RIGHT", 0);
        // _bluetooth.printLeftRight("LEFT", "RIGHT", 1);
        // _bluetooth.printNewLine();
        // _bluetooth.printLeftRight("LEFT", "RIGHT", 2);
        // _bluetooth.printCustom("Body left", 1, 0);
        // _bluetooth.printCustom("Body right", 0, 2);
        // _bluetooth.printNewLine();
        // _bluetooth.printCustom("Terimakasih", 2, 1);
        // _bluetooth.printNewLine();
        // _bluetooth.printQRcode("Insert Your Own Text to Generate");
        // _bluetooth.printNewLine();
        // _bluetooth.printNewLine();
        _bluetooth.paperCut();
      }
    });
  }

  void _connectBluetooth() {
    if (_device == null) {
      _showSnackBar("No device selected.");
    } else {
      _bluetooth.isConnected.then((isConnected) async {
        if (!isConnected) {
          try {
            await _bluetooth.connect(_device);
          } on PlatformException catch (e) {
            _showSnackBar("Failed to connect bluetooth");

            setState(() => _bluetoothPressed = false);
          }

          setState(() => _bluetoothPressed = true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Device:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton(
                      items: _getDeviceItems(),
                      onChanged: (value) {
                        if (_bluetoothConnected) {
                          _disconnectBluetooth()
                              .then((val) => setState(() => _device = value));
                        } else {
                          setState(() => _device = value);
                        }
                      },
                      value: _device,
                    ),
                    RaisedButton(
                      onPressed: _bluetoothPressed
                          ? null
                          : _bluetoothConnected
                              ? _disconnectBluetooth
                              : _connectBluetooth,
                      child:
                          Text(_bluetoothConnected ? 'Disconnect' : 'Connect'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                child: RaisedButton(
                  onPressed: _bluetoothConnected ? _tesPrint : null,
                  child: Text('TesPrint'),
                ),
              ),
            ],
          )),
    );
  }
}
