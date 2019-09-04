// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ShiftBean implements Bean<Shift> {
  final id = IntField('id');
  final actualBalance = DoubleField('actual_balance');
  final systemBalance = DoubleField('system_balance');
  final differenceBalance = DoubleField('difference_balance');
  final beginningBalance = DoubleField('beginning_balance');
  final cashCredit = DoubleField('cash_credit');
  final cashDebit = DoubleField('cash_debit');
  final cashOther = DoubleField('cash_other');
  final cashSales = DoubleField('cash_sales');
  final cashback = DoubleField('cashback');
  final closeId = IntField('close_id');
  final closedBy = StrField('closed_by');
  final openBy = StrField('open_by');
  final startingTime = StrField('starting_time');
  final closingTime = StrField('closing_time');
  final merchantId = IntField('merchant_id');
  final merchantName = StrField('merchant_name');
  final outletId = IntField('outlet_id');
  final outletName = StrField('outlet_name');
  final endDate = IntField('end_date');
  final startDate = IntField('start_date');
  final openId = IntField('open_id');
  final reject = IntField('reject');
  final cancel = IntField('cancel');
  final sales = IntField('sales');
  final uniqShiftId = StrField('uniq_shift_id');
  final deviceId = StrField('device_id');
  final synchronize = BoolField('synchronize');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        actualBalance.name: actualBalance,
        systemBalance.name: systemBalance,
        differenceBalance.name: differenceBalance,
        beginningBalance.name: beginningBalance,
        cashCredit.name: cashCredit,
        cashDebit.name: cashDebit,
        cashOther.name: cashOther,
        cashSales.name: cashSales,
        cashback.name: cashback,
        closeId.name: closeId,
        closedBy.name: closedBy,
        openBy.name: openBy,
        startingTime.name: startingTime,
        closingTime.name: closingTime,
        merchantId.name: merchantId,
        merchantName.name: merchantName,
        outletId.name: outletId,
        outletName.name: outletName,
        endDate.name: endDate,
        startDate.name: startDate,
        openId.name: openId,
        reject.name: reject,
        cancel.name: cancel,
        sales.name: sales,
        uniqShiftId.name: uniqShiftId,
        deviceId.name: deviceId,
        synchronize.name: synchronize,
      };
  Shift fromMap(Map map) {
    Shift model = Shift();
    model.id = adapter.parseValue(map['id']);
    model.actualBalance = adapter.parseValue(map['actual_balance']);
    model.systemBalance = adapter.parseValue(map['system_balance']);
    model.differenceBalance = adapter.parseValue(map['difference_balance']);
    model.beginningBalance = adapter.parseValue(map['beginning_balance']);
    model.cashCredit = adapter.parseValue(map['cash_credit']);
    model.cashDebit = adapter.parseValue(map['cash_debit']);
    model.cashOther = adapter.parseValue(map['cash_other']);
    model.cashSales = adapter.parseValue(map['cash_sales']);
    model.cashback = adapter.parseValue(map['cashback']);
    model.closeId = adapter.parseValue(map['close_id']);
    model.closedBy = adapter.parseValue(map['closed_by']);
    model.openBy = adapter.parseValue(map['open_by']);
    model.startingTime = adapter.parseValue(map['starting_time']);
    model.closingTime = adapter.parseValue(map['closing_time']);
    model.merchantId = adapter.parseValue(map['merchant_id']);
    model.merchantName = adapter.parseValue(map['merchant_name']);
    model.outletId = adapter.parseValue(map['outlet_id']);
    model.outletName = adapter.parseValue(map['outlet_name']);
    model.endDate = adapter.parseValue(map['end_date']);
    model.startDate = adapter.parseValue(map['start_date']);
    model.openId = adapter.parseValue(map['open_id']);
    model.reject = adapter.parseValue(map['reject']);
    model.cancel = adapter.parseValue(map['cancel']);
    model.sales = adapter.parseValue(map['sales']);
    model.uniqShiftId = adapter.parseValue(map['uniq_shift_id']);
    model.deviceId = adapter.parseValue(map['device_id']);
    model.synchronize = adapter.parseValue(map['synchronize']);

    return model;
  }

  List<SetColumn> toSetColumns(Shift model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(actualBalance.set(model.actualBalance));
      ret.add(systemBalance.set(model.systemBalance));
      ret.add(differenceBalance.set(model.differenceBalance));
      ret.add(beginningBalance.set(model.beginningBalance));
      ret.add(cashCredit.set(model.cashCredit));
      ret.add(cashDebit.set(model.cashDebit));
      ret.add(cashOther.set(model.cashOther));
      ret.add(cashSales.set(model.cashSales));
      ret.add(cashback.set(model.cashback));
      ret.add(closeId.set(model.closeId));
      ret.add(closedBy.set(model.closedBy));
      ret.add(openBy.set(model.openBy));
      ret.add(startingTime.set(model.startingTime));
      ret.add(closingTime.set(model.closingTime));
      ret.add(merchantId.set(model.merchantId));
      ret.add(merchantName.set(model.merchantName));
      ret.add(outletId.set(model.outletId));
      ret.add(outletName.set(model.outletName));
      ret.add(endDate.set(model.endDate));
      ret.add(startDate.set(model.startDate));
      ret.add(openId.set(model.openId));
      ret.add(reject.set(model.reject));
      ret.add(cancel.set(model.cancel));
      ret.add(sales.set(model.sales));
      ret.add(uniqShiftId.set(model.uniqShiftId));
      ret.add(deviceId.set(model.deviceId));
      ret.add(synchronize.set(model.synchronize));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(actualBalance.name))
        ret.add(actualBalance.set(model.actualBalance));
      if (only.contains(systemBalance.name))
        ret.add(systemBalance.set(model.systemBalance));
      if (only.contains(differenceBalance.name))
        ret.add(differenceBalance.set(model.differenceBalance));
      if (only.contains(beginningBalance.name))
        ret.add(beginningBalance.set(model.beginningBalance));
      if (only.contains(cashCredit.name))
        ret.add(cashCredit.set(model.cashCredit));
      if (only.contains(cashDebit.name))
        ret.add(cashDebit.set(model.cashDebit));
      if (only.contains(cashOther.name))
        ret.add(cashOther.set(model.cashOther));
      if (only.contains(cashSales.name))
        ret.add(cashSales.set(model.cashSales));
      if (only.contains(cashback.name)) ret.add(cashback.set(model.cashback));
      if (only.contains(closeId.name)) ret.add(closeId.set(model.closeId));
      if (only.contains(closedBy.name)) ret.add(closedBy.set(model.closedBy));
      if (only.contains(openBy.name)) ret.add(openBy.set(model.openBy));
      if (only.contains(startingTime.name))
        ret.add(startingTime.set(model.startingTime));
      if (only.contains(closingTime.name))
        ret.add(closingTime.set(model.closingTime));
      if (only.contains(merchantId.name))
        ret.add(merchantId.set(model.merchantId));
      if (only.contains(merchantName.name))
        ret.add(merchantName.set(model.merchantName));
      if (only.contains(outletId.name)) ret.add(outletId.set(model.outletId));
      if (only.contains(outletName.name))
        ret.add(outletName.set(model.outletName));
      if (only.contains(endDate.name)) ret.add(endDate.set(model.endDate));
      if (only.contains(startDate.name))
        ret.add(startDate.set(model.startDate));
      if (only.contains(openId.name)) ret.add(openId.set(model.openId));
      if (only.contains(reject.name)) ret.add(reject.set(model.reject));
      if (only.contains(cancel.name)) ret.add(cancel.set(model.cancel));
      if (only.contains(sales.name)) ret.add(sales.set(model.sales));
      if (only.contains(uniqShiftId.name))
        ret.add(uniqShiftId.set(model.uniqShiftId));
      if (only.contains(deviceId.name)) ret.add(deviceId.set(model.deviceId));
      if (only.contains(synchronize.name))
        ret.add(synchronize.set(model.synchronize));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.actualBalance != null) {
        ret.add(actualBalance.set(model.actualBalance));
      }
      if (model.systemBalance != null) {
        ret.add(systemBalance.set(model.systemBalance));
      }
      if (model.differenceBalance != null) {
        ret.add(differenceBalance.set(model.differenceBalance));
      }
      if (model.beginningBalance != null) {
        ret.add(beginningBalance.set(model.beginningBalance));
      }
      if (model.cashCredit != null) {
        ret.add(cashCredit.set(model.cashCredit));
      }
      if (model.cashDebit != null) {
        ret.add(cashDebit.set(model.cashDebit));
      }
      if (model.cashOther != null) {
        ret.add(cashOther.set(model.cashOther));
      }
      if (model.cashSales != null) {
        ret.add(cashSales.set(model.cashSales));
      }
      if (model.cashback != null) {
        ret.add(cashback.set(model.cashback));
      }
      if (model.closeId != null) {
        ret.add(closeId.set(model.closeId));
      }
      if (model.closedBy != null) {
        ret.add(closedBy.set(model.closedBy));
      }
      if (model.openBy != null) {
        ret.add(openBy.set(model.openBy));
      }
      if (model.startingTime != null) {
        ret.add(startingTime.set(model.startingTime));
      }
      if (model.closingTime != null) {
        ret.add(closingTime.set(model.closingTime));
      }
      if (model.merchantId != null) {
        ret.add(merchantId.set(model.merchantId));
      }
      if (model.merchantName != null) {
        ret.add(merchantName.set(model.merchantName));
      }
      if (model.outletId != null) {
        ret.add(outletId.set(model.outletId));
      }
      if (model.outletName != null) {
        ret.add(outletName.set(model.outletName));
      }
      if (model.endDate != null) {
        ret.add(endDate.set(model.endDate));
      }
      if (model.startDate != null) {
        ret.add(startDate.set(model.startDate));
      }
      if (model.openId != null) {
        ret.add(openId.set(model.openId));
      }
      if (model.reject != null) {
        ret.add(reject.set(model.reject));
      }
      if (model.cancel != null) {
        ret.add(cancel.set(model.cancel));
      }
      if (model.sales != null) {
        ret.add(sales.set(model.sales));
      }
      if (model.uniqShiftId != null) {
        ret.add(uniqShiftId.set(model.uniqShiftId));
      }
      if (model.deviceId != null) {
        ret.add(deviceId.set(model.deviceId));
      }
      if (model.synchronize != null) {
        ret.add(synchronize.set(model.synchronize));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addDouble(actualBalance.name, isNullable: true);
    st.addDouble(systemBalance.name, isNullable: true);
    st.addDouble(differenceBalance.name, isNullable: true);
    st.addDouble(beginningBalance.name, isNullable: true);
    st.addDouble(cashCredit.name, isNullable: true);
    st.addDouble(cashDebit.name, isNullable: true);
    st.addDouble(cashOther.name, isNullable: true);
    st.addDouble(cashSales.name, isNullable: true);
    st.addDouble(cashback.name, isNullable: true);
    st.addInt(closeId.name, isNullable: true);
    st.addStr(closedBy.name, isNullable: true);
    st.addStr(openBy.name, isNullable: true);
    st.addStr(startingTime.name, isNullable: true);
    st.addStr(closingTime.name, isNullable: true);
    st.addInt(merchantId.name, isNullable: true);
    st.addStr(merchantName.name, isNullable: true);
    st.addInt(outletId.name, isNullable: true);
    st.addStr(outletName.name, isNullable: true);
    st.addInt(endDate.name, isNullable: true);
    st.addInt(startDate.name, isNullable: true);
    st.addInt(openId.name, isNullable: true);
    st.addInt(reject.name, isNullable: true);
    st.addInt(cancel.name, isNullable: true);
    st.addInt(sales.name, isNullable: true);
    st.addStr(uniqShiftId.name, primary: true, isNullable: false);
    st.addStr(deviceId.name, isNullable: true);
    st.addBool(synchronize.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Shift model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<Shift> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Shift model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<Shift> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
    }
    final UpsertMany upsert = upserters.addAll(data);
    await adapter.upsertMany(upsert);
    return;
  }

  Future<int> update(Shift model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .where(this.uniqShiftId.eq(model.uniqShiftId))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Shift> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(
          this.id.eq(model.id).and(this.uniqShiftId.eq(model.uniqShiftId)));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<Shift> find(int id, String uniqShiftId,
      {bool preload = false, bool cascade = false}) async {
    final Find find =
        finder.where(this.id.eq(id)).where(this.uniqShiftId.eq(uniqShiftId));
    return await findOne(find);
  }

  Future<int> remove(int id, String uniqShiftId) async {
    final Remove remove =
        remover.where(this.id.eq(id)).where(this.uniqShiftId.eq(uniqShiftId));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Shift> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id) | this.uniqShiftId.eq(model.uniqShiftId));
    }
    return adapter.remove(remove);
  }
}
