// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order()
    ..transactionId = json['transactionId'] as String
    ..orderId = json['orderId'] as int
    ..serviceCharge = json['serviceCharge'] as int
    ..promoDiscount = json['promoDiscount'] as int
    ..salesDiscount = json['salesDiscount'] as int
    ..shiftId = json['shiftId'] as int
    ..createdId = json['createdId'] as int
    ..placeId = json['placeId'] as int
    ..subTotal = (json['subTotal'] as num)?.toDouble()
    ..cash = (json['cash'] as num)?.toDouble()
    ..change = (json['change'] as num)?.toDouble()
    ..ppn = (json['ppn'] as num)?.toDouble()
    ..grandTotal = (json['grandTotal'] as num)?.toDouble()
    ..transactionTime = json['transactionTime'] as int
    ..paymentTypeId = json['paymentTypeId'] as int
    ..serviceTypeId = json['serviceTypeId'] as int
    ..reservationId = json['reservationId'] as int
    ..reservationName = json['reservationName'] as String
    ..customerName = json['customerName'] as String
    ..uniqShiftId = json['uniqShiftId'] as String
    ..placeName = json['placeName'] as String
    ..clientId = json['clientId'] as String;
}

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('serviceCharge', instance.serviceCharge);
  writeNotNull('promoDiscount', instance.promoDiscount);
  writeNotNull('salesDiscount', instance.salesDiscount);
  writeNotNull('shiftId', instance.shiftId);
  writeNotNull('createdId', instance.createdId);
  writeNotNull('placeId', instance.placeId);
  writeNotNull('subTotal', instance.subTotal);
  writeNotNull('cash', instance.cash);
  writeNotNull('change', instance.change);
  writeNotNull('ppn', instance.ppn);
  writeNotNull('grandTotal', instance.grandTotal);
  writeNotNull('transactionTime', instance.transactionTime);
  writeNotNull('paymentTypeId', instance.paymentTypeId);
  writeNotNull('serviceTypeId', instance.serviceTypeId);
  writeNotNull('reservationId', instance.reservationId);
  writeNotNull('reservationName', instance.reservationName);
  writeNotNull('customerName', instance.customerName);
  writeNotNull('uniqShiftId', instance.uniqShiftId);
  writeNotNull('placeName', instance.placeName);
  writeNotNull('clientId', instance.clientId);
  return val;
}
