import 'dart:convert';

import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';
import 'package:json_annotation/json_annotation.dart';
import 'outlet.dart';

part 'user.g.dart';
part 'user.jorm.dart';

@JsonSerializable(includeIfNull: false)
class User {
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

  @Column()
  String username;

  @Column(isNullable: true)
  String profileName;

  @Column(isNullable: true)
  String pin;

  @Column(isNullable: true)
  String role;

  @Column(isNullable: true)
  String phone;

  @Column(isNullable: true)
  String password;

  @Column(isNullable: true)
  @JsonKey(fromJson: User.deserializeMapFromString)
  String menu;

  @Column()
  @JsonKey(fromJson: User.deserializeMapFromString)
  String merchant;

  @Column()
  @JsonKey(fromJson: User.deserializeMapFromString)
  String businessType;

  @Column()
  @JsonKey(fromJson: User.deserializeMapFromString)
  String roleApplication;

  @Column()
  @JsonKey(toJson: User.serializeResource, fromJson: User.deserializeResource)
  int resource;

  @Column(isNullable: true)
  bool omsUsed;

  @Column(isNullable: true)
  bool payUpfront;

  @HasMany(OutletBean)
  List<Outlet> outlets;

  @JsonKey(toJson: User.serializeAsNul)
  String token;

  @Column()
  @JsonKey(ignore: true)
  int outletIdSelected;

  @Column()
  @JsonKey(ignore: true)
  String loginAs;

  static serializeAsNul(dynamic param) => null;

  static deserializeMapFromString(dynamic param) =>
      param != null ? json.encode(param) : "";

  static serializeResource(dynamic param) => "MOBILE_CASHIER";

  static deserializeResource(dynamic param) => 1;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter)
      : outletBean = OutletBean(adapter),
        super(adapter);

  final OutletBean outletBean;

  final String tableName = 'users';
}
