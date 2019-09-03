// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _UserBean implements Bean<User> {
  final id = IntField('id');
  final username = StrField('username');
  final profileName = StrField('profile_name');
  final pin = StrField('pin');
  final role = StrField('role');
  final phone = StrField('phone');
  final password = StrField('password');
  final menu = StrField('menu');
  final merchant = StrField('merchant');
  final businessType = StrField('business_type');
  final roleApplication = StrField('role_application');
  final resource = IntField('resource');
  final omsUsed = BoolField('oms_used');
  final payUpfront = BoolField('pay_upfront');
  final token = StrField('token');
  final outletIdSelected = IntField('outlet_id_selected');
  final loginAs = StrField('login_as');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        username.name: username,
        profileName.name: profileName,
        pin.name: pin,
        role.name: role,
        phone.name: phone,
        password.name: password,
        menu.name: menu,
        merchant.name: merchant,
        businessType.name: businessType,
        roleApplication.name: roleApplication,
        resource.name: resource,
        omsUsed.name: omsUsed,
        payUpfront.name: payUpfront,
        token.name: token,
        outletIdSelected.name: outletIdSelected,
        loginAs.name: loginAs,
      };
  User fromMap(Map map) {
    User model = User();
    model.id = adapter.parseValue(map['id']);
    model.username = adapter.parseValue(map['username']);
    model.profileName = adapter.parseValue(map['profile_name']);
    model.pin = adapter.parseValue(map['pin']);
    model.role = adapter.parseValue(map['role']);
    model.phone = adapter.parseValue(map['phone']);
    model.password = adapter.parseValue(map['password']);
    model.menu = adapter.parseValue(map['menu']);
    model.merchant = adapter.parseValue(map['merchant']);
    model.businessType = adapter.parseValue(map['business_type']);
    model.roleApplication = adapter.parseValue(map['role_application']);
    model.resource = adapter.parseValue(map['resource']);
    model.omsUsed = adapter.parseValue(map['oms_used']);
    model.payUpfront = adapter.parseValue(map['pay_upfront']);
    model.token = adapter.parseValue(map['token']);
    model.outletIdSelected = adapter.parseValue(map['outlet_id_selected']);
    model.loginAs = adapter.parseValue(map['login_as']);

    return model;
  }

  List<SetColumn> toSetColumns(User model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(username.set(model.username));
      ret.add(profileName.set(model.profileName));
      ret.add(pin.set(model.pin));
      ret.add(role.set(model.role));
      ret.add(phone.set(model.phone));
      ret.add(password.set(model.password));
      ret.add(menu.set(model.menu));
      ret.add(merchant.set(model.merchant));
      ret.add(businessType.set(model.businessType));
      ret.add(roleApplication.set(model.roleApplication));
      ret.add(resource.set(model.resource));
      ret.add(omsUsed.set(model.omsUsed));
      ret.add(payUpfront.set(model.payUpfront));
      ret.add(token.set(model.token));
      ret.add(outletIdSelected.set(model.outletIdSelected));
      ret.add(loginAs.set(model.loginAs));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(username.name)) ret.add(username.set(model.username));
      if (only.contains(profileName.name))
        ret.add(profileName.set(model.profileName));
      if (only.contains(pin.name)) ret.add(pin.set(model.pin));
      if (only.contains(role.name)) ret.add(role.set(model.role));
      if (only.contains(phone.name)) ret.add(phone.set(model.phone));
      if (only.contains(password.name)) ret.add(password.set(model.password));
      if (only.contains(menu.name)) ret.add(menu.set(model.menu));
      if (only.contains(merchant.name)) ret.add(merchant.set(model.merchant));
      if (only.contains(businessType.name))
        ret.add(businessType.set(model.businessType));
      if (only.contains(roleApplication.name))
        ret.add(roleApplication.set(model.roleApplication));
      if (only.contains(resource.name)) ret.add(resource.set(model.resource));
      if (only.contains(omsUsed.name)) ret.add(omsUsed.set(model.omsUsed));
      if (only.contains(payUpfront.name))
        ret.add(payUpfront.set(model.payUpfront));
      if (only.contains(token.name)) ret.add(token.set(model.token));
      if (only.contains(outletIdSelected.name))
        ret.add(outletIdSelected.set(model.outletIdSelected));
      if (only.contains(loginAs.name)) ret.add(loginAs.set(model.loginAs));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.username != null) {
        ret.add(username.set(model.username));
      }
      if (model.profileName != null) {
        ret.add(profileName.set(model.profileName));
      }
      if (model.pin != null) {
        ret.add(pin.set(model.pin));
      }
      if (model.role != null) {
        ret.add(role.set(model.role));
      }
      if (model.phone != null) {
        ret.add(phone.set(model.phone));
      }
      if (model.password != null) {
        ret.add(password.set(model.password));
      }
      if (model.menu != null) {
        ret.add(menu.set(model.menu));
      }
      if (model.merchant != null) {
        ret.add(merchant.set(model.merchant));
      }
      if (model.businessType != null) {
        ret.add(businessType.set(model.businessType));
      }
      if (model.roleApplication != null) {
        ret.add(roleApplication.set(model.roleApplication));
      }
      if (model.resource != null) {
        ret.add(resource.set(model.resource));
      }
      if (model.omsUsed != null) {
        ret.add(omsUsed.set(model.omsUsed));
      }
      if (model.payUpfront != null) {
        ret.add(payUpfront.set(model.payUpfront));
      }
      if (model.token != null) {
        ret.add(token.set(model.token));
      }
      if (model.outletIdSelected != null) {
        ret.add(outletIdSelected.set(model.outletIdSelected));
      }
      if (model.loginAs != null) {
        ret.add(loginAs.set(model.loginAs));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addStr(username.name, isNullable: false);
    st.addStr(profileName.name, isNullable: false);
    st.addStr(pin.name, isNullable: false);
    st.addStr(role.name, isNullable: false);
    st.addStr(phone.name, isNullable: false);
    st.addStr(password.name, isNullable: false);
    st.addStr(menu.name, isNullable: false);
    st.addStr(merchant.name, isNullable: false);
    st.addStr(businessType.name, isNullable: false);
    st.addStr(roleApplication.name, isNullable: false);
    st.addInt(resource.name, isNullable: false);
    st.addBool(omsUsed.name, isNullable: false);
    st.addBool(payUpfront.name, isNullable: false);
    st.addStr(token.name, isNullable: false);
    st.addInt(outletIdSelected.name, isNullable: false);
    st.addStr(loginAs.name, isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(User model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.insert(insert);
    if (cascade) {
      User newModel;
      if (model.outlets != null) {
        newModel ??= await find(model.id);
        model.outlets.forEach((x) => outletBean.associateUser(x, newModel));
        for (final child in model.outlets) {
          await outletBean.insert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> insertMany(List<User> models,
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

  Future<dynamic> upsert(User model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    var retId = await adapter.upsert(upsert);
    if (cascade) {
      User newModel;
      if (model.outlets != null) {
        newModel ??= await find(model.id);
        model.outlets.forEach((x) => outletBean.associateUser(x, newModel));
        for (final child in model.outlets) {
          await outletBean.upsert(child, cascade: cascade);
        }
      }
    }
    return retId;
  }

  Future<void> upsertMany(List<User> models,
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

  Future<int> update(User model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    final ret = adapter.update(update);
    if (cascade) {
      User newModel;
      if (model.outlets != null) {
        if (associate) {
          newModel ??= await find(model.id);
          model.outlets.forEach((x) => outletBean.associateUser(x, newModel));
        }
        for (final child in model.outlets) {
          await outletBean.update(child,
              cascade: cascade, associate: associate);
        }
      }
    }
    return ret;
  }

  Future<void> updateMany(List<User> models,
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

  Future<User> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    final User model = await findOne(find);
    if (preload && model != null) {
      await this.preload(model, cascade: cascade);
    }
    return model;
  }

  Future<int> remove(int id, {bool cascade = false}) async {
    if (cascade) {
      final User newModel = await find(id);
      if (newModel != null) {
        await outletBean.removeByUser(newModel.id);
      }
    }
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<User> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<User> preload(User model, {bool cascade = false}) async {
    model.outlets = await outletBean.findByUser(model.id,
        preload: cascade, cascade: cascade);
    return model;
  }

  Future<List<User>> preloadAll(List<User> models,
      {bool cascade = false}) async {
    models.forEach((User model) => model.outlets ??= []);
    await OneToXHelper.preloadAll<User, Outlet>(
        models,
        (User model) => [model.id],
        outletBean.findByUserList,
        (Outlet model) => [model.userid],
        (User model, Outlet child) =>
            model.outlets = List.from(model.outlets)..add(child),
        cascade: cascade);
    return models;
  }

  OutletBean get outletBean;
}
