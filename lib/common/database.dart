import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:padi_pos_kasir/config/env.dart';
import 'package:padi_pos_kasir/model/merchant_preference.dart';
import 'package:padi_pos_kasir/model/product.dart';
import 'package:padi_pos_kasir/model/product_category.dart';
import 'package:padi_pos_kasir/model/user.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqf;

class Database {
  static SqfliteAdapter _adapter;

  static ProductBean _productBean;

  static ProductCategoryBean _productCategoryBean;

  static UserBean _userBean;

  static MerchantPreferencesBean _merchantPreferencesBean;

  /// make sure if you run build runner in order change the jorm file
  /// update this version, to drop all the table and make new
  static int _dbVersion = 1;

  static Future<SqfliteAdapter> getAdapter() async {
    if (Database._adapter == null) {
      await sqf.Sqflite.setDebugModeOn(env.flavor == BuildFlavor.development);

      String dbPath = await sqf.getDatabasesPath();
      Database._adapter = SqfliteAdapter(path.join(dbPath, "padi-pos-kasir.db"),
          version: _dbVersion);

      sqf.Database conn = await sqf.openDatabase(
        dbPath, version: _dbVersion
        // dbPath, version: _dbVersion, onCreate: (){}, onUpgrade: (){}
      );
      Database._adapter = SqfliteAdapter.fromConnection(conn);

      await Database._adapter.connect();

      assert(Database._adapter.connection != null);
    }

    return Database._adapter;
  }

  static Future<ProductBean> getProductBean() async {
    if (Database._productBean == null) {
      var adapter = await Database.getAdapter();

      Database._productBean = ProductBean(adapter);

      if (adapter.version != Database._dbVersion) {
        await Database._productBean.drop();
        await Database._productBean.createTable();
      }

      await Database._productBean.createTable(ifNotExists: true);
    }

    return Database._productBean;
  }

  static Future<ProductCategoryBean> getProductCategoryBean() async {
    if (Database._productCategoryBean == null) {
      var adapter = await Database.getAdapter();

      Database._productCategoryBean = ProductCategoryBean(adapter);

      if (adapter.version != Database._dbVersion) {
        await Database._productCategoryBean.drop();
        await Database._productCategoryBean.createTable();
      }

      await Database._productCategoryBean.createTable(ifNotExists: true);
    }

    return Database._productCategoryBean;
  }

  static Future<UserBean> getUserBean() async {
    if (Database._userBean == null) {
      var adapter = await Database.getAdapter();

      Database._userBean = UserBean(adapter);

      if (adapter.version != Database._dbVersion) {
        await Database._userBean.drop();
        await Database._userBean.createTable();
      }

      await Database._userBean.createTable(ifNotExists: true);
    }

    return Database._userBean;
  }

  static Future<MerchantPreferencesBean> getMerchantPreferencesBean() async {
    if (Database._merchantPreferencesBean == null) {
      var adapter = await Database.getAdapter();

      Database._merchantPreferencesBean = MerchantPreferencesBean(adapter);

      if (adapter.version != Database._dbVersion) {
        await Database._merchantPreferencesBean.drop();
        await Database._merchantPreferencesBean.createTable();
      }

      await Database._merchantPreferencesBean.createTable(ifNotExists: true);
    }

    return Database._merchantPreferencesBean;
  }
}
