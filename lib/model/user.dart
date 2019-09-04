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

  @Column(isNullable: true)
  String username = "";

  @Column(isNullable: true)
  String profileName = "";

  @Column(isNullable: true)
  String pin = "";

  @Column(isNullable: true)
  String role = "";

  @Column(isNullable: true)
  String phone = "";

  @Column(isNullable: true)
  String password = "";

  @Column(isNullable: true)
  String menu = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  List<dynamic> get menuList {
    return BaseEntity.stringToJsonMap(menu, defaultValue: []);
  }

  @Column(isNullable: true)
  String merchant = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  Map<String, dynamic> get merchantMap {
    return BaseEntity.stringToJsonMap(merchant);
  }

  @Column(isNullable: true)
  String businessType = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  Map<String, dynamic> get businessTypeMap {
    return BaseEntity.stringToJsonMap(businessType);
  }

  @Column(isNullable: true)
  String roleApplication = "";

  @JsonKey(ignore: true)
  @IgnoreColumn()
  Map<String, dynamic> get roleApplicationMap {
    return BaseEntity.stringToJsonMap(roleApplication);
  }

  @JsonKey(toJson: User.serializeResource, fromJson: User.deserializeResource)
  @Column(isNullable: true)
  int resource;

  @Column(isNullable: true)
  bool omsUsed = false;

  @Column(isNullable: true)
  bool payUpfront = false;

  @HasMany(OutletBean)
  List<Outlet> outlets;

  @Column(isNullable: true)
  String token = "";

  @JsonKey(ignore: true)
  @Column(isNullable: true)
  int outletIdSelected;

  @JsonKey(ignore: true)
  @Column(isNullable: true)
  String loginAs;

  static serializeResource(dynamic param) => "MOBILE_CASHIER";

  static deserializeResource(dynamic param) => 1;

  factory User.fromJson(Map<String, dynamic> json) {
    ["roleApplication", "merchant", "businessType"].forEach((i) {
      if (json[i] is Map) {
        json[i] = BaseEntity.jsonMapToString(json[i]);
      }
    });

    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var userJson = _$UserToJson(this);

    if (userJson['outlets'] is List) {
      userJson['outlets'] = (userJson['outlets'] as List<Outlet>).map((outlet) {
        if (outlet is Outlet) {
          return outlet.toJson();
        }

        return outlet;
      }).toList();
    }

    return userJson;
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
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if ((model.id ?? 0) != 0) {
      var user = await super.find(model.id);

      if (user != null) {
        return super.update(model,
            cascade: cascade, onlyNonNull: onlyNonNull, only: only);
      }
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
