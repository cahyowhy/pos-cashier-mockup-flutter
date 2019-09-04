// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_type.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ServiceTypeBean implements Bean<ServiceType> {
  final id = IntField('id');
  final serviceName = StrField('service_name');
  final type = StrField('type');
  final color = StrField('color');
  final charges = DoubleField('charges');
  final deleted = BoolField('deleted');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        serviceName.name: serviceName,
        type.name: type,
        color.name: color,
        charges.name: charges,
        deleted.name: deleted,
      };
  ServiceType fromMap(Map map) {
    ServiceType model = ServiceType();
    model.id = adapter.parseValue(map['id']);
    model.serviceName = adapter.parseValue(map['service_name']);
    model.type = adapter.parseValue(map['type']);
    model.color = adapter.parseValue(map['color']);
    model.charges = adapter.parseValue(map['charges']);
    model.deleted = adapter.parseValue(map['deleted']);

    return model;
  }

  List<SetColumn> toSetColumns(ServiceType model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(serviceName.set(model.serviceName));
      ret.add(type.set(model.type));
      ret.add(color.set(model.color));
      ret.add(charges.set(model.charges));
      ret.add(deleted.set(model.deleted));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(serviceName.name))
        ret.add(serviceName.set(model.serviceName));
      if (only.contains(type.name)) ret.add(type.set(model.type));
      if (only.contains(color.name)) ret.add(color.set(model.color));
      if (only.contains(charges.name)) ret.add(charges.set(model.charges));
      if (only.contains(deleted.name)) ret.add(deleted.set(model.deleted));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.serviceName != null) {
        ret.add(serviceName.set(model.serviceName));
      }
      if (model.type != null) {
        ret.add(type.set(model.type));
      }
      if (model.color != null) {
        ret.add(color.set(model.color));
      }
      if (model.charges != null) {
        ret.add(charges.set(model.charges));
      }
      if (model.deleted != null) {
        ret.add(deleted.set(model.deleted));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addStr(serviceName.name, isNullable: true);
    st.addStr(type.name, isNullable: true);
    st.addStr(color.name, isNullable: true);
    st.addDouble(charges.name, isNullable: true);
    st.addBool(deleted.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ServiceType model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<ServiceType> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(ServiceType model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<ServiceType> models,
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

  Future<int> update(ServiceType model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<ServiceType> models,
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

  Future<ServiceType> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ServiceType> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }
}
