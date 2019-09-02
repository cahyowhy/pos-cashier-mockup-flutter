// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _ProductBean implements Bean<Product> {
  final id = IntField('id');
  final name = StrField('name');
  final guid = StrField('guid');
  final image = StrField('image');
  final price = IntField('price');
  final hasPromo = BoolField('has_promo');
  final rating = IntField('rating');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        guid.name: guid,
        image.name: image,
        price.name: price,
        hasPromo.name: hasPromo,
        rating.name: rating,
      };
  Product fromMap(Map map) {
    Product model = Product();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.guid = adapter.parseValue(map['guid']);
    model.image = adapter.parseValue(map['image']);
    model.price = adapter.parseValue(map['price']);
    model.hasPromo = adapter.parseValue(map['has_promo']);
    model.rating = adapter.parseValue(map['rating']);

    return model;
  }

  List<SetColumn> toSetColumns(Product model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      ret.add(name.set(model.name));
      ret.add(guid.set(model.guid));
      ret.add(image.set(model.image));
      ret.add(price.set(model.price));
      ret.add(hasPromo.set(model.hasPromo));
      ret.add(rating.set(model.rating));
    } else if (only != null) {
      if (model.id != null) {
        if (only.contains(id.name)) ret.add(id.set(model.id));
      }
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(guid.name)) ret.add(guid.set(model.guid));
      if (only.contains(image.name)) ret.add(image.set(model.image));
      if (only.contains(price.name)) ret.add(price.set(model.price));
      if (only.contains(hasPromo.name)) ret.add(hasPromo.set(model.hasPromo));
      if (only.contains(rating.name)) ret.add(rating.set(model.rating));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.guid != null) {
        ret.add(guid.set(model.guid));
      }
      if (model.image != null) {
        ret.add(image.set(model.image));
      }
      if (model.price != null) {
        ret.add(price.set(model.price));
      }
      if (model.hasPromo != null) {
        ret.add(hasPromo.set(model.hasPromo));
      }
      if (model.rating != null) {
        ret.add(rating.set(model.rating));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, autoIncrement: true, isNullable: false);
    st.addStr(name.name, length: 50, isNullable: false);
    st.addStr(guid.name, isNullable: true);
    st.addStr(image.name, isNullable: true);
    st.addInt(price.name, isNullable: false);
    st.addBool(hasPromo.name, isNullable: false);
    st.addInt(rating.name, isNullable: true);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Product model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.insert(insert);
    if (cascade) {
      Product newModel;
      if (model.productCategory != null) {
        newModel ??= await find(retId);
        productCategoryBean.associateProduct(model.productCategory, newModel);
        await productCategoryBean.insert(model.productCategory,
            cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> insertMany(List<Product> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(insert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
      final List<List<SetColumn>> data = models
          .map((model) =>
              toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
          .toList();
      final InsertMany insert = inserters.addAll(data);
      await adapter.insertMany(insert);
      return;
    }
  }

  Future<dynamic> upsert(Product model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .id(id.name);
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      Product newModel;
      if (model.productCategory != null) {
        newModel ??= await find(retId);
        productCategoryBean.associateProduct(model.productCategory, newModel);
        await productCategoryBean.upsert(model.productCategory,
            cascade: cascade);
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<Product> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(upsert(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<int> update(Product model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      Product newModel;
      if (model.productCategory != null) {
        if (associate) {
          newModel ??= await find(model.id);
          productCategoryBean.associateProduct(model.productCategory, newModel);
        }
        await productCategoryBean.update(model.productCategory,
            cascade: cascade, associate: associate);
      }
    }
    return ret;
  }

  Future<void> updateMany(List<Product> models,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    if (cascade) {
      final List<Future> futures = [];
      for (var model in models) {
        futures.add(update(model, cascade: cascade));
      }
      await Future.wait(futures);
      return;
    } else {
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
  }

  Future<Product> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final Product model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final Product newModel = await find(id);
      if (newModel != null) {
        await productCategoryBean.removeByProduct(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Product> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<Product> preload(Product model, {bool cascade = false}) async {
    model.productCategory = await productCategoryBean.findByProduct(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<Product>> preloadAll(List<Product> models,
      {bool cascade = false}) async {
    await OneToXHelper.preloadAll<Product, ProductCategory>(
        models,
        (Product model) => [model.id],
        productCategoryBean.findByProductList,
        (ProductCategory model) => [model.productId],
        (Product model, ProductCategory child) => model.productCategory = child,
        cascade: cascade);
    return models;
  }

  ProductCategoryBean get productCategoryBean;
}
