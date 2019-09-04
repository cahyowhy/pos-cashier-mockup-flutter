// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _PaymentTypeBean implements Bean<PaymentType> {
  final id = IntField('id');
  final type = StrField('type');
  final accountName = StrField('account_name');
  final accountNumber = StrField('account_number');
  final validityPeriodMonth = StrField('validity_period_month');
  final validityPeriodYear = StrField('validity_period_year');
  final deleted = BoolField('deleted');
  final grouper = StrField('grouper');
  final icon = StrField('icon');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        type.name: type,
        accountName.name: accountName,
        accountNumber.name: accountNumber,
        validityPeriodMonth.name: validityPeriodMonth,
        validityPeriodYear.name: validityPeriodYear,
        deleted.name: deleted,
        grouper.name: grouper,
        icon.name: icon,
      };
  PaymentType fromMap(Map map) {
    PaymentType model = PaymentType();
    model.id = adapter.parseValue(map['id']);
    model.type = adapter.parseValue(map['type']);
    model.accountName = adapter.parseValue(map['account_name']);
    model.accountNumber = adapter.parseValue(map['account_number']);
    model.validityPeriodMonth =
        adapter.parseValue(map['validity_period_month']);
    model.validityPeriodYear = adapter.parseValue(map['validity_period_year']);
    model.deleted = adapter.parseValue(map['deleted']);
    model.grouper = adapter.parseValue(map['grouper']);
    model.icon = adapter.parseValue(map['icon']);

    return model;
  }

  List<SetColumn> toSetColumns(PaymentType model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(type.set(model.type));
      ret.add(accountName.set(model.accountName));
      ret.add(accountNumber.set(model.accountNumber));
      ret.add(validityPeriodMonth.set(model.validityPeriodMonth));
      ret.add(validityPeriodYear.set(model.validityPeriodYear));
      ret.add(deleted.set(model.deleted));
      ret.add(grouper.set(model.grouper));
      ret.add(icon.set(model.icon));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(type.name)) ret.add(type.set(model.type));
      if (only.contains(accountName.name))
        ret.add(accountName.set(model.accountName));
      if (only.contains(accountNumber.name))
        ret.add(accountNumber.set(model.accountNumber));
      if (only.contains(validityPeriodMonth.name))
        ret.add(validityPeriodMonth.set(model.validityPeriodMonth));
      if (only.contains(validityPeriodYear.name))
        ret.add(validityPeriodYear.set(model.validityPeriodYear));
      if (only.contains(deleted.name)) ret.add(deleted.set(model.deleted));
      if (only.contains(grouper.name)) ret.add(grouper.set(model.grouper));
      if (only.contains(icon.name)) ret.add(icon.set(model.icon));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.type != null) {
        ret.add(type.set(model.type));
      }
      if (model.accountName != null) {
        ret.add(accountName.set(model.accountName));
      }
      if (model.accountNumber != null) {
        ret.add(accountNumber.set(model.accountNumber));
      }
      if (model.validityPeriodMonth != null) {
        ret.add(validityPeriodMonth.set(model.validityPeriodMonth));
      }
      if (model.validityPeriodYear != null) {
        ret.add(validityPeriodYear.set(model.validityPeriodYear));
      }
      if (model.deleted != null) {
        ret.add(deleted.set(model.deleted));
      }
      if (model.grouper != null) {
        ret.add(grouper.set(model.grouper));
      }
      if (model.icon != null) {
        ret.add(icon.set(model.icon));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addStr(type.name, isNullable: true);
    st.addStr(accountName.name, isNullable: true);
    st.addStr(accountNumber.name, isNullable: true);
    st.addStr(validityPeriodMonth.name, isNullable: true);
    st.addStr(validityPeriodYear.name, isNullable: true);
    st.addBool(deleted.name, isNullable: true);
    st.addStr(grouper.name, isNullable: true);
    st.addStr(icon.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(PaymentType model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<PaymentType> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(PaymentType model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<PaymentType> models,
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

  Future<int> update(PaymentType model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<PaymentType> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = [];
    final List<Expression> where = [];
    for (var i = 0; i < models.length; ++i) {
      var model = models[i];
      data.add(
          toSetColumns(model, only: only, onlyNonNull: onlyNonNull).toList());
      where.add(this.id.eq(model.id));
    }
    final UpdateMany update = updaters.addAll(data, where);
    await adapter.updateMany(update);
    return;
  }

  Future<PaymentType> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<PaymentType> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}
