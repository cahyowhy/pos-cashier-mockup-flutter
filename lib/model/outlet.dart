import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'outlet.g.dart';
part 'outlet.jorm.dart';

@JsonSerializable(includeIfNull: false)
class Outlet {
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

  String name = "";

  String address = "";

  String phone = "";

  String note = "";

  String logoPath = "";

  String facebookPath = "";

  String whatsappPath = "";

  String twitterPath = "";

  String instagramPath = "";

  int remainingDays = 0;

  bool trial = true;

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

  Future<dynamic> insert(Outlet model,
      {bool cascade = false, bool onlyNonNull = false, Set<String> only}) {
    if ((model.id ?? 0) != 0) {
      return super.update(model,
          cascade: cascade, onlyNonNull: onlyNonNull, only: only);
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
