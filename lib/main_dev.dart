import './main_app.dart';
import 'package:flutter/material.dart';

import 'config/env.dart';

void main() {
  BuildEnvironment.init(
      flavor: BuildFlavor.development,
      baseUrl: 'http://192.168.0.33/',
      cdnUrl: 'http://192.168.0.31/',
      socketUrl: 'http://192.168.0.49/');
  assert(env != null);

  runApp(MyApp());
}
