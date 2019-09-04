// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_preference.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _MerchantPreferencesBean implements Bean<MerchantPreferences> {
  final id = IntField('id');
  final omsUsed = BoolField('oms_used');
  final payUpfront = BoolField('pay_upfront');
  final updateTime = IntField('update_time');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        omsUsed.name: omsUsed,
        payUpfront.name: payUpfront,
        updateTime.name: updateTime,
      };
  MerchantPreferences fromMap(Map map) {
    MerchantPreferences model = MerchantPreferences();
    model.id = adapter.parseValue(map['id']);
    model.omsUsed = adapter.parseValue(map['oms_used']);
    model.payUpfront = adapter.parseValue(map['pay_upfront']);
    model.updateTime = adapter.parseValue(map['update_time']);

    return model;
  }

  List<SetColumn> toSetColumns(MerchantPreferences model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(omsUsed.set(model.omsUsed));
      ret.add(payUpfront.set(model.payUpfront));
      ret.add(updateTime.set(model.updateTime));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(omsUsed.name)) ret.add(omsUsed.set(model.omsUsed));
      if (only.contains(payUpfront.name))
        ret.add(payUpfront.set(model.payUpfront));
      if (only.contains(updateTime.name))
        ret.add(updateTime.set(model.updateTime));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.omsUsed != null) {
        ret.add(omsUsed.set(model.omsUsed));
      }
      if (model.payUpfront != null) {
        ret.add(payUpfront.set(model.payUpfront));
      }
      if (model.updateTime != null) {
        ret.add(updateTime.set(model.updateTime));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addBool(omsUsed.name, isNullable: true);
    st.addBool(payUpfront.name, isNullable: true);
    st.addInt(updateTime.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(MerchantPreferences model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<MerchantPreferences> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(MerchantPreferences model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<MerchantPreferences> models,
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

  Future<int> update(MerchantPreferences model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<MerchantPreferences> models,
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

  Future<MerchantPreferences> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<MerchantPreferences> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}
