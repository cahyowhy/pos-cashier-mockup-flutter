import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:padi_pos_kasir/model/user.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

class Storage {
  static FlutterSecureStorage _storage;

  static FlutterSecureStorage getStorage() {
    if (_storage == null) {
      _storage = new FlutterSecureStorage();
    }

    return _storage;
  }

  static Future<dynamic> readValue({String key}) async {
    if (key.isEmpty) {
      return await getStorage().readAll();
    }

    return await getStorage().read(key: key);
  }

  static Future<void> deleteValue({String key}) async {
    if (key.isEmpty) {
      await getStorage().deleteAll();
    }

    await getStorage().delete(key: key);
  }

  static Future<void> writeValue(String key, dynamic value) async {
    String finalValue;

    if (value is String) {
      finalValue = value;
    } else {
      finalValue = json.encode(value);
    }

    await getStorage().write(key: key, value: finalValue);
  }
}

class Authentication {
  static Future<User> getUser() async {
    User user = User();

    try {
      String userStorage = await Storage.readValue(key: 'user');

      if (user != null) {
        user = User.fromJson(json.decode(userStorage));
      }
    } catch (e) {
      LogUtil.print(e.toString());
    }

    return user;
  }

  static Future<dynamic> getToken() async {
    User user = await Authentication.getUser();

    return user.token;
  }
}
