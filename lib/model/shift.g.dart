// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return Shift()
    ..id = json['id'] as int
    ..actualBalance = (json['actualBalance'] as num)?.toDouble()
    ..systemBalance = (json['systemBalance'] as num)?.toDouble()
    ..differenceBalance = (json['differenceBalance'] as num)?.toDouble()
    ..beginningBalance = (json['beginningBalance'] as num)?.toDouble()
    ..cashCredit = (json['cashCredit'] as num)?.toDouble()
    ..cashDebit = (json['cashDebit'] as num)?.toDouble()
    ..cashOther = (json['cashOther'] as num)?.toDouble()
    ..cashSales = (json['cashSales'] as num)?.toDouble()
    ..cashback = (json['cashback'] as num)?.toDouble()
    ..closeId = json['closeId'] as int
    ..closedBy = json['closedBy'] as String
    ..openBy = json['openBy'] as String
    ..startingTime = json['startingTime'] as String
    ..closingTime = json['closingTime'] as String
    ..merchantId = json['merchantId'] as int
    ..merchantName = json['merchantName'] as String
    ..outletId = json['outletId'] as int
    ..outletName = json['outletName'] as String
    ..endDate = json['endDate'] as int
    ..startDate = json['startDate'] as int
    ..openId = json['openId'] as int
    ..reject = json['reject'] as int
    ..cancel = json['cancel'] as int
    ..sales = json['sales'] as int;
}

Map<String, dynamic> _$ShiftToJson(Shift instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('actualBalance', instance.actualBalance);
  writeNotNull('systemBalance', instance.systemBalance);
  writeNotNull('differenceBalance', instance.differenceBalance);
  writeNotNull('beginningBalance', instance.beginningBalance);
  writeNotNull('cashCredit', instance.cashCredit);
  writeNotNull('cashDebit', instance.cashDebit);
  writeNotNull('cashOther', instance.cashOther);
  writeNotNull('cashSales', instance.cashSales);
  writeNotNull('cashback', instance.cashback);
  writeNotNull('closeId', instance.closeId);
  writeNotNull('closedBy', instance.closedBy);
  writeNotNull('openBy', instance.openBy);
  writeNotNull('startingTime', instance.startingTime);
  writeNotNull('closingTime', instance.closingTime);
  writeNotNull('merchantId', instance.merchantId);
  writeNotNull('merchantName', instance.merchantName);
  writeNotNull('outletId', instance.outletId);
  writeNotNull('outletName', instance.outletName);
  writeNotNull('endDate', instance.endDate);
  writeNotNull('startDate', instance.startDate);
  writeNotNull('openId', instance.openId);
  writeNotNull('reject', instance.reject);
  writeNotNull('cancel', instance.cancel);
  writeNotNull('sales', instance.sales);
  return val;
}
