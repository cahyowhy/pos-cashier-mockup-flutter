// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return Reservation()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..pax = json['pax'] as int
    ..startTime = json['startTime'] as int
    ..endTime = json['endTime'] as int;
}

Map<String, dynamic> _$ReservationToJson(Reservation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('pax', instance.pax);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('endTime', instance.endTime);
  return val;
}
