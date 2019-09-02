import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
