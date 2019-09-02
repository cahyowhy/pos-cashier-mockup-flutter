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

  @Column()
  bool omsUsed;

  @Column()
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
}
