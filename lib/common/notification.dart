import 'package:fluttertoast/fluttertoast.dart';
import 'package:padi_pos_kasir/style/style.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';

enum Type { INFO, DANGER, SUCCESS }

class NotifToast {
  static showToast(
      {String msg,
      String status,
      Type type = Type.INFO,
      ToastGravity position = ToastGravity.BOTTOM,
      Toast length = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
      msg: (msg ?? localization(['NOTIFICATION', (status ?? '0000')])),
      toastLength: length,
      gravity: position,
      timeInSecForIos: 1,
      backgroundColor: type == Type.SUCCESS
          ? CommonStyle.success
          : type == Type.DANGER ? CommonStyle.danger : CommonStyle.info,
    );
  }
}
