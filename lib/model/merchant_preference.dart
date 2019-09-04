import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant_preference.g.dart';
part 'merchant_preference.jorm.dart';

@JsonSerializable(includeIfNull: false)
class MerchantPreferences {
  MerchantPreferences({this.id, this.omsUsed, this.payUpfront});

  MerchantPreferences.make(this.id, this.omsUsed, this.payUpfront);

  @PrimaryKey()
  int id;

  @Column(isNullable: true)
  bool omsUsed;

  @Column(isNullable: true)
  bool payUpfront;

  @Column(isNullable: true)
  int updateTime;

  factory MerchantPreferences.fromJson(Map<String, dynamic> json) =>
      _$MerchantPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantPreferencesToJson(this);
}

@GenBean()
class MerchantPreferencesBean extends Bean<MerchantPreferences>
    with _MerchantPreferencesBean {
  MerchantPreferencesBean(Adapter adapter) : super(adapter);

  final String tableName = 'merchant_preferences';

  Future<dynamic> insert(MerchantPreferences model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if ((model.id ?? 0) != 0) {
      var merchantPref = await super.find(model.id);

      if (merchantPref != null) {
        return super.update(model,
            cascade: cascade, onlyNonNull: onlyNonNull, only: only);
      }
    }

    return super
        .insert(model, cascade: cascade, onlyNonNull: onlyNonNull, only: only);
  }
}
