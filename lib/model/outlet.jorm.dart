// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// BeanGenerator
// **************************************************************************

abstract class _OutletBean implements Bean<Outlet> {
  final id = IntField('id');
  final name = StrField('name');
  final address = StrField('address');
  final phone = StrField('phone');
  final note = StrField('note');
  final logoPath = StrField('logo_path');
  final facebookPath = StrField('facebook_path');
  final whatsappPath = StrField('whatsapp_path');
  final twitterPath = StrField('twitter_path');
  final instagramPath = StrField('instagram_path');
  final remainingDays = IntField('remaining_days');
  final trial = BoolField('trial');
  final userid = IntField('userid');
  Map<String, Field> _fields;
  Map<String, Field> get fields => _fields ??= {
        id.name: id,
        name.name: name,
        address.name: address,
        phone.name: phone,
        note.name: note,
        logoPath.name: logoPath,
        facebookPath.name: facebookPath,
        whatsappPath.name: whatsappPath,
        twitterPath.name: twitterPath,
        instagramPath.name: instagramPath,
        remainingDays.name: remainingDays,
        trial.name: trial,
        userid.name: userid,
      };
  Outlet fromMap(Map map) {
    Outlet model = Outlet();
    model.id = adapter.parseValue(map['id']);
    model.name = adapter.parseValue(map['name']);
    model.address = adapter.parseValue(map['address']);
    model.phone = adapter.parseValue(map['phone']);
    model.note = adapter.parseValue(map['note']);
    model.logoPath = adapter.parseValue(map['logo_path']);
    model.facebookPath = adapter.parseValue(map['facebook_path']);
    model.whatsappPath = adapter.parseValue(map['whatsapp_path']);
    model.twitterPath = adapter.parseValue(map['twitter_path']);
    model.instagramPath = adapter.parseValue(map['instagram_path']);
    model.remainingDays = adapter.parseValue(map['remaining_days']);
    model.trial = adapter.parseValue(map['trial']);
    model.userid = adapter.parseValue(map['userid']);

    return model;
  }

  List<SetColumn> toSetColumns(Outlet model,
      {bool update = false, Set<String> only, bool onlyNonNull = false}) {
    List<SetColumn> ret = [];

    if (only == null && !onlyNonNull) {
      ret.add(id.set(model.id));
      ret.add(name.set(model.name));
      ret.add(address.set(model.address));
      ret.add(phone.set(model.phone));
      ret.add(note.set(model.note));
      ret.add(logoPath.set(model.logoPath));
      ret.add(facebookPath.set(model.facebookPath));
      ret.add(whatsappPath.set(model.whatsappPath));
      ret.add(twitterPath.set(model.twitterPath));
      ret.add(instagramPath.set(model.instagramPath));
      ret.add(remainingDays.set(model.remainingDays));
      ret.add(trial.set(model.trial));
      ret.add(userid.set(model.userid));
    } else if (only != null) {
      if (only.contains(id.name)) ret.add(id.set(model.id));
      if (only.contains(name.name)) ret.add(name.set(model.name));
      if (only.contains(address.name)) ret.add(address.set(model.address));
      if (only.contains(phone.name)) ret.add(phone.set(model.phone));
      if (only.contains(note.name)) ret.add(note.set(model.note));
      if (only.contains(logoPath.name)) ret.add(logoPath.set(model.logoPath));
      if (only.contains(facebookPath.name))
        ret.add(facebookPath.set(model.facebookPath));
      if (only.contains(whatsappPath.name))
        ret.add(whatsappPath.set(model.whatsappPath));
      if (only.contains(twitterPath.name))
        ret.add(twitterPath.set(model.twitterPath));
      if (only.contains(instagramPath.name))
        ret.add(instagramPath.set(model.instagramPath));
      if (only.contains(remainingDays.name))
        ret.add(remainingDays.set(model.remainingDays));
      if (only.contains(trial.name)) ret.add(trial.set(model.trial));
      if (only.contains(userid.name)) ret.add(userid.set(model.userid));
    } else /* if (onlyNonNull) */ {
      if (model.id != null) {
        ret.add(id.set(model.id));
      }
      if (model.name != null) {
        ret.add(name.set(model.name));
      }
      if (model.address != null) {
        ret.add(address.set(model.address));
      }
      if (model.phone != null) {
        ret.add(phone.set(model.phone));
      }
      if (model.note != null) {
        ret.add(note.set(model.note));
      }
      if (model.logoPath != null) {
        ret.add(logoPath.set(model.logoPath));
      }
      if (model.facebookPath != null) {
        ret.add(facebookPath.set(model.facebookPath));
      }
      if (model.whatsappPath != null) {
        ret.add(whatsappPath.set(model.whatsappPath));
      }
      if (model.twitterPath != null) {
        ret.add(twitterPath.set(model.twitterPath));
      }
      if (model.instagramPath != null) {
        ret.add(instagramPath.set(model.instagramPath));
      }
      if (model.remainingDays != null) {
        ret.add(remainingDays.set(model.remainingDays));
      }
      if (model.trial != null) {
        ret.add(trial.set(model.trial));
      }
      if (model.userid != null) {
        ret.add(userid.set(model.userid));
      }
    }

    return ret;
  }

  Future<void> createTable({bool ifNotExists = false}) async {
    final st = Sql.create(tableName, ifNotExists: ifNotExists);
    st.addInt(id.name, primary: true, isNullable: false);
    st.addStr(name.name, isNullable: true);
    st.addStr(address.name, isNullable: true);
    st.addStr(phone.name, isNullable: true);
    st.addStr(note.name, isNullable: true);
    st.addStr(logoPath.name, isNullable: true);
    st.addStr(facebookPath.name, isNullable: true);
    st.addStr(whatsappPath.name, isNullable: true);
    st.addStr(twitterPath.name, isNullable: true);
    st.addStr(instagramPath.name, isNullable: true);
    st.addInt(remainingDays.name, isNullable: true);
    st.addBool(trial.name, isNullable: true);
    st.addInt(userid.name,
        foreignTable: userBean.tableName, foreignCol: 'id', isNullable: false);
    return adapter.createTable(st);
  }

  Future<dynamic> insert(Outlet model,
      {bool cascade = false,
      bool onlyNonNull = false,
      Set<String> only}) async {
    final Insert insert = inserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.insert(insert);
  }

  Future<void> insertMany(List<Outlet> models,
      {bool onlyNonNull = false, Set<String> only}) async {
    final List<List<SetColumn>> data = models
        .map((model) =>
            toSetColumns(model, only: only, onlyNonNull: onlyNonNull))
        .toList();
    final InsertMany insert = inserters.addAll(data);
    await adapter.insertMany(insert);
    return;
  }

  Future<dynamic> upsert(Outlet model,
      {bool cascade = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Upsert upsert = upserter
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.upsert(upsert);
  }

  Future<void> upsertMany(List<Outlet> models,
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

  Future<int> update(Outlet model,
      {bool cascade = false,
      bool associate = false,
      Set<String> only,
      bool onlyNonNull = false}) async {
    final Update update = updater
        .where(this.id.eq(model.id))
        .setMany(toSetColumns(model, only: only, onlyNonNull: onlyNonNull));
    return adapter.update(update);
  }

  Future<void> updateMany(List<Outlet> models,
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

  Future<Outlet> find(int id,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.id.eq(id));
    return await findOne(find);
  }

  Future<int> remove(int id) async {
    final Remove remove = remover.where(this.id.eq(id));
    return adapter.remove(remove);
  }

  Future<int> removeMany(List<Outlet> models) async {
// Return if models is empty. If this is not done, all records will be removed!
    if (models == null || models.isEmpty) return 0;
    final Remove remove = remover;
    for (final model in models) {
      remove.or(this.id.eq(model.id));
    }
    return adapter.remove(remove);
  }

  Future<List<Outlet>> findByUser(int userid,
      {bool preload = false, bool cascade = false}) async {
    final Find find = finder.where(this.userid.eq(userid));
    return findMany(find);
  }

  Future<List<Outlet>> findByUserList(List<User> models,
      {bool preload = false, bool cascade = false}) async {
// Return if models is empty. If this is not done, all the records will be returned!
    if (models == null || models.isEmpty) return [];
    final Find find = finder;
    for (User model in models) {
      find.or(this.userid.eq(model.id));
    }
    return findMany(find);
  }

  Future<int> removeByUser(int userid) async {
    final Remove rm = remover.where(this.userid.eq(userid));
    return await adapter.remove(rm);
  }

  void associateUser(Outlet child, User parent) {
    child.userid = parent.id;
  }

  UserBean get userBean;
}
