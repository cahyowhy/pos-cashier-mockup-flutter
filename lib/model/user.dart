import 'dart:convert';

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:padi_pos_kasir/model/base_entity.dart';
import 'outlet.dart';

part 'user.g.dart';
part 'user.jorm.dart';

@JsonSerializable(includeIfNull: false)
class User extends BaseEntity {
  User({this.username, this.password});

  User.make(
      this.id,
      this.username,
      this.profileName,
      this.pin,
      this.role,
      this.phone,
      this.password,
      this.token,
      this.merchant,
      this.roleApplication,
      this.resource,
      this.omsUsed,
      this.payUpfront,
      this.outlets);

  @PrimaryKey()
  int id;

  String username = "";

  String profileName = "";

  String pin = "";

  String role = "";

  String phone = "";

  String password = "";

  @JsonKey(fromJson: User.deserializeMapFromString)
  String menu = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  List<dynamic> get menuList {
    return BaseEntity.stringToJsonMap(menu, defaultValue: []);
  }

  @JsonKey(fromJson: User.deserializeMapFromString)
  String merchant = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  Map<String, dynamic> get merchantMap {
    return BaseEntity.stringToJsonMap(merchant);
  }

  @JsonKey(fromJson: User.deserializeMapFromString)
  String businessType = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  Map<String, dynamic> get businessTypeMap {
    return BaseEntity.stringToJsonMap(businessType);
  }

  @JsonKey(fromJson: User.deserializeMapFromString)
  String roleApplication = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  Map<String, dynamic> get roleApplicationMap {
    return BaseEntity.stringToJsonMap(roleApplication);
  }

  @JsonKey(toJson: User.serializeResource, fromJson: User.deserializeResource)
  int resource;

  bool omsUsed = false;

  bool payUpfront = false;

  @HasMany(OutletBean)
  List<Outlet> outlets;

  String token = "";

  @JsonKey(ignore: true)
  int outletIdSelected = 0;

  @JsonKey(ignore: true)
  String loginAs = "";

  static deserializeMapFromString(dynamic param) =>
      param != null ? json.encode(param) : "";

  static serializeResource(dynamic param) => "MOBILE_CASHIER";

  static deserializeResource(dynamic param) => 1;

  factory User.fromJson(Map<String, dynamic> json) {
    ["menu", "merchant", "businessType"].forEach((i) {
      json[i] = BaseEntity.stringToJsonMap(json[i]);
    });

    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var json = _$UserToJson(this);
    json.remove('token');

    return json;
  }
}

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter)
      : outletBean = OutletBean(adapter),
        super(adapter);

  final OutletBean outletBean;

  final String tableName = 'users';

  Future<dynamic> insert(User model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    if ((model.id ?? 0) != 0) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
