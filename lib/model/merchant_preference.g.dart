// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantPreferences _$MerchantPreferencesFromJson(Map<String, dynamic> json) {
  return MerchantPreferences(
    id: json['id'] as int,
    omsUsed: json['omsUsed'] as bool,
    payUpfront: json['payUpfront'] as bool,
  )..updateTime = json['updateTime'] as int;
}

Map<String, dynamic> _$MerchantPreferencesToJson(MerchantPreferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('omsUsed', instance.omsUsed);
  writeNotNull('payUpfront', instance.payUpfront);
  writeNotNull('updateTime', instance.updateTime);
  return val;
}
