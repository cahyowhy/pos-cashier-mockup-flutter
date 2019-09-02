// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ProductCategoryBean implements Bean<ProductCategory> {
  final id = IntField('id');
  final name = StrField('name');
  final keterangan = StrField('keterangan');
  final productId = IntField('product_id');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        keterangan.name: keterangan,
        productId.name: productId,
      };
  ProductCategory fromMap(Map map) {
    ProductCategory model = ProductCategory();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.keterangan = adapter.parseValue(map['keterangan']);
    model.productId = adapter.parseValue(map['product_id']);

    return model;
  }

  List<SetColumn> toSetColumns(ProductCategory model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(name.set(model.name));
      ret.add(keterangan.set(model.keterangan));
      ret.add(productId.set(model.productId));
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(keterangan.name))
        ret.add(keterangan.set(model.keterangan));
      if (only.contains(productId.name))
        ret.add(productId.set(model.productId));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.keterangan != null) {
        ret.add(keterangan.set(model.keterangan));
      }
      if (model.productId != null) {
        ret.add(productId.set(model.productId));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(name.name, length: 20, isNullable: false);
    st.addStr(keterangan.name, isNullable: false);
    st.addInt(productId.name,
        foreignTable: productBean.tableName,
        foreignCol: 'id',
        isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(ProductCategory model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      ProductCategory newModel;
    }
    return retId;
  }

  Future<void> insertMany(List<ProductCategory> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(ProductCategory model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      ProductCategory newModel;
    }
    return retId;
  }

  Future<void> upsertMany(List<ProductCategory> models,
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

  Future<int> update(ProductCategory model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<ProductCategory> models,
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

  Future<ProductCategory> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<ProductCategory> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<ProductCategory> findByProduct(int productId,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.productId.eq(productId));
    return findOne(find);
  }

  Future<List<ProductCategory>> findByProductList(List<Product> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (Product model in models) {
      find.or(this.productId.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByProduct(int productId) async {
    final Remove rm = remover.where(this.productId.eq(productId));
    return await adapter.remove(rm);
  }

  void associateProduct(ProductCategory child, Product parent) {
    child.productId = parent.id;
  }

  ProductBean get productBean;
}
