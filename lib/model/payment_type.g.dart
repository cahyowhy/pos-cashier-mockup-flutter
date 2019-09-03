// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentType _$PaymentTypeFromJson(Map<String, dynamic> json) {
  return PaymentType(
    type: json['type'] as String,
  )
    ..id = json['id'] as int
    ..accountName = json['accountName'] as String
    ..accountNumber = json['accountNumber'] as String
    ..validityPeriodMonth = json['validityPeriodMonth'] as String
    ..validityPeriodYear = json['validityPeriodYear'] as String
    ..deleted = json['deleted'] as bool;
}

Map<String, dynamic> _$PaymentTypeToJson(PaymentType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('accountName', instance.accountName);
  writeNotNull('accountNumber', instance.accountNumber);
  writeNotNull('validityPeriodMonth', instance.validityPeriodMonth);
  writeNotNull('validityPeriodYear', instance.validityPeriodYear);
  writeNotNull('deleted', instance.deleted);
  return val;
}
