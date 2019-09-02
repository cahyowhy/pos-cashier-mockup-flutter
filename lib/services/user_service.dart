import 'package:padi_pos_kasir/common/database.dart';
import 'package:padi_pos_kasir/common/storage.dart';
import 'package:padi_pos_kasir/services/response.dart';

import './proxy.dart';
import '../config/env.dart';

import '../model/user.dart';

class UserService extends ProxyService {
  String url = env.baseUrl + "core/users/";

  dynamic serializer(dynamic json) {
    if (json != null) {
      if (json is List<dynamic>) {
        List<User> users = (json as List).map((item) {
          return User.fromJson(item);
        }).toList();

        return users;
      } else {
        return User.fromJson(json);
      }
    }

    return null;
  }

  Future<void> doLogin(Map<String, dynamic> param) {
    return super
        .post(param, url: env.baseUrl + 'core/do-login')
        .then((Response res) {
      if (res.isSuccess()) {
        User user = res.getDeserializeResponse(defaultValue: User());

        Future.wait([
          Storage.writeValue('token', user.token),
          Storage.writeValue('menus', res.getResponseBody([], key: 'menu')),
          Database.getUserBean()
        ]).then((responses) {
          if (responses.length == 2) {
            var userBean = responses[2] as UserBean;
            
            userBean.insert(user);
            userBean.getAll().then((res) {
              print(res);
            });
          }
        });
      }
    });
  }

  static final UserService instance = UserService._private();
  UserService._private();
  factory UserService() => instance;
}
