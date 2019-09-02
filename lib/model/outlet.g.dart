// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Outlet _$OutletFromJson(Map<String, dynamic> json) {
  return Outlet(
    id: json['id'] as int,
    name: json['name'] as String,
  )
    ..address = json['address'] as String
    ..phone = json['phone'] as String
    ..note = json['note'] as String
    ..logoPath = json['logoPath'] as String
    ..facebookPath = json['facebookPath'] as String
    ..whatsappPath = json['whatsappPath'] as String
    ..twitterPath = json['twitterPath'] as String
    ..instagramPath = json['instagramPath'] as String
    ..remainingDays = json['remainingDays'] as int
    ..trial = json['trial'] as bool;
}

Map<String, dynamic> _$OutletToJson(Outlet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  writeNotNull('phone', instance.phone);
  writeNotNull('note', instance.note);
  writeNotNull('logoPath', instance.logoPath);
  writeNotNull('facebookPath', instance.facebookPath);
  writeNotNull('whatsappPath', instance.whatsappPath);
  writeNotNull('twitterPath', instance.twitterPath);
  writeNotNull('instagramPath', instance.instagramPath);
  writeNotNull('remainingDays', instance.remainingDays);
  writeNotNull('trial', instance.trial);
  return val;
}
