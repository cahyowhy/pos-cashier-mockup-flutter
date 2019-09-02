import 'package:padi_pos_kasir/services/response.dart';

import './proxy.dart';
import '../config/env.dart';

import '../model/user.dart';

class UserService extends ProxyService {
  String url = env.baseUrl + "core/users/";

  dynamic serializer(dynamic json) {
    if (json != null) {
      if (json is List<dynamic>) {
        List<User> users = json.map((item) {
          return User.fromJson(item);
        }).toList();

        return users;
      } else {
        return User.fromJson(json);
      }
    }

    return null;
  }

  Future<Response> doLogin(Map<String, dynamic> param) {
    return super.post(param, url: env.baseUrl + 'core/do-login');
  }

  static final UserService instance = UserService._private();
  UserService._private();
  factory UserService() => instance;
}
