import './main_app.dart';
import 'package:flutter/material.dart';

import 'config/env.dart';

void main() {
  BuildEnvironment.init(
      flavor: BuildFlavor.production,
      baseUrl: 'https://api.padipos.id/',
      cdnUrl: 'https://img.padipos.id/',
      socketUrl: 'mqtts://mqtt.padipos.id/');

  runApp(MyApp());
}
