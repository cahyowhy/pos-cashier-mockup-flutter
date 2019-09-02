import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'outlet.g.dart';
part 'outlet.jorm.dart';

@JsonSerializable(includeIfNull: false)
class Outlet  {
  Outlet({this.id, this.name});

  Outlet.make(
      this.id,
      this.name,
      this.address,
      this.phone,
      this.note,
      this.logoPath,
      this.facebookPath,
      this.whatsappPath,
      this.twitterPath,
      this.instagramPath,
      this.remainingDays,
      this.trial,
      this.userid);

  @PrimaryKey()
  int id;

  @Column()
  String name;

  @Column(isNullable: true)
  String address;

  @Column(isNullable: true)
  String phone;

  @Column(isNullable: true)
  String note;

  @Column(isNullable: true)
  String logoPath;

  @Column(isNullable: true)
  String facebookPath;

  @Column(isNullable: true)
  String whatsappPath;

  @Column(isNullable: true)
  String twitterPath;

  @Column(isNullable: true)
  String instagramPath;

  @Column(isNullable: true)
  int remainingDays;

  @Column(isNullable: true)
  bool trial;

  @BelongsTo(UserBean)
  @JsonKey(ignore: true)
  int userid;

  factory Outlet.fromJson(Map<String, dynamic> json) => _$OutletFromJson(json);

  Map<String, dynamic> toJson() => _$OutletToJson(this);
}

@GenBean()
class OutletBean extends Bean<Outlet> with _OutletBean {
  UserBean _userBean;

  @override
  UserBean get userBean => _userBean ??= new UserBean(adapter);

  OutletBean(Adapter adapter) : super(adapter);

  final String tableName = 'outlets';
}
