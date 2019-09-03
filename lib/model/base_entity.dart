import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:padi_pos_kasir/config/constant.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

/// Created by Cahyo on 2019-09-03 13:09:27.

class BaseEntity {
  static serializeAsNul(dynamic param) => null;

  /// delete 0, empty string & null values
  static deleteEmptyVal(Map<String, dynamic> json, List<String> keys) {
    assert(keys.length > 0);

    json.keys.where((String k) => keys.contains(k)).toList().forEach((i) {
      if (json[i] != null) {
        if (json[i] is String && json[i].isEmpty) {
          json.remove(i);
        } else if (json[i] is int && json[i] == 0) {
          json.remove(i);
        } else if (json[i] is Map && json[i].isEmpty) {
          json.remove(i);
        }
      } else {
        json.remove(i);
      }
    });
  }

  /// from int to formatedstring date
  static serializedDate(Map<String, dynamic> json, List<String> keys) {
    assert(keys.length > 0);

    json.keys.where((String k) => keys.contains(k)).toList().forEach((i) {
      if (json[i] is int && json[i] != null) {
        DateTime date = DateTime.fromMillisecondsSinceEpoch(json[i]);
        json[i] = new DateFormat(Constant.SERIALIZE_DATE_PATTERN).format(date);
      }
    });
  }

  /// from formatedstring date to int
  static deserializeDate(Map<String, dynamic> json, List<String> keys) {
    assert(keys.length > 0);

    json.keys.where((String k) => keys.contains(k)).toList().forEach((i) {
      if (json[i] is String && json[i] != null) {
        DateTime date =
            new DateFormat(Constant.SERIALIZE_DATE_PATTERN).parseLoose(json[i]);
        json[i] = date.millisecondsSinceEpoch;
      }
    });
  }

  /// convert String to Json
  static stringToJsonMap(String param) {
    if ((param ?? "").isNotEmpty) {
      try {
        return json.decode(param);
      } catch (e) {
        LogUtil.print(e.toString());

        return {};
      }
    }

    return {};
  }

  /// convert String to Json
  static jsonMapToString(Map param) {
    if ((param ?? {}).isNotEmpty) {
      try {
        return json.encode(param);
      } catch (e) {
        LogUtil.print(e.toString());

        return "";
      }
    }

    return {};
  }
}
