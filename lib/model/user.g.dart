// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    password: json['password'] as String,
  )
    ..id = json['id'] as int
    ..profileName = json['profileName'] as String
    ..pin = json['pin'] as String
    ..role = json['role'] as String
    ..phone = json['phone'] as String
    ..menu = User.deserializeMapFromString(json['menu'])
    ..merchant = User.deserializeMapFromString(json['merchant'])
    ..businessType = User.deserializeMapFromString(json['businessType'])
    ..roleApplication = User.deserializeMapFromString(json['roleApplication'])
    ..resource = User.deserializeResource(json['resource'])
    ..omsUsed = json['omsUsed'] as bool
    ..payUpfront = json['payUpfront'] as bool
    ..outlets = (json['outlets'] as List)
        ?.map((e) =>
            e == null ? null : Outlet.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..token = json['token'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('profileName', instance.profileName);
  writeNotNull('pin', instance.pin);
  writeNotNull('role', instance.role);
  writeNotNull('phone', instance.phone);
  writeNotNull('password', instance.password);
  writeNotNull('menu', instance.menu);
  writeNotNull('merchant', instance.merchant);
  writeNotNull('businessType', instance.businessType);
  writeNotNull('roleApplication', instance.roleApplication);
  writeNotNull('resource', User.serializeResource(instance.resource));
  writeNotNull('omsUsed', instance.omsUsed);
  writeNotNull('payUpfront', instance.payUpfront);
  writeNotNull('outlets', instance.outlets);
  writeNotNull('token', instance.token);
  return val;
}
