// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceType _$ServiceTypeFromJson(Map<String, dynamic> json) {
  return ServiceType(
    serviceName: json['serviceName'] as String,
    type: json['type'] as String,
  )
    ..id = json['id'] as int
    ..deleted = json['deleted'] as bool;
}

Map<String, dynamic> _$ServiceTypeToJson(ServiceType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('serviceName', instance.serviceName);
  writeNotNull('type', instance.type);
  writeNotNull('deleted', instance.deleted);
  return val;
}
