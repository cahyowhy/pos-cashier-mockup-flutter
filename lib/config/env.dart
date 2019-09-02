import 'package:meta/meta.dart';

enum BuildFlavor { production, development, staging }

BuildEnvironment get env => _env;
BuildEnvironment _env;

class BuildEnvironment {
  final String baseUrl;
  final String cdnUrl;
  final String socketUrl;
  final BuildFlavor flavor;

  BuildEnvironment._init(this.flavor, this.baseUrl, this.cdnUrl, this.socketUrl);

  static void init({@required flavor, @required baseUrl, @required cdnUrl, @required socketUrl}) =>
      _env ??= BuildEnvironment._init(flavor, baseUrl, cdnUrl, socketUrl);
}
