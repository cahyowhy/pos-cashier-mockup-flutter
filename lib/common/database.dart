import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:padi_pos_kasir/config/env.dart';
import 'package:padi_pos_kasir/model/merchant_preference.dart';
import 'package:padi_pos_kasir/model/product.dart';
import 'package:padi_pos_kasir/model/product_category.dart';
import 'package:padi_pos_kasir/model/user.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class Database {
  static SqfliteAdapter _adapter;

  static ProductBean _productBean;

  static ProductCategoryBean _productCategoryBean;

  static UserBean _userBean;

  static MerchantPreferencesBean _merchantPreferencesBean;

  static Future<SqfliteAdapter> getAdapter() async {
    if (Database._adapter == null) {
      await Sqflite.setDebugModeOn(env.flavor == BuildFlavor.development);
      String dbPath = await getDatabasesPath();
      Database._adapter =
          SqfliteAdapter(path.join(dbPath, "padi-pos-kasir.db"));

      try {
        await Database._adapter.connect();
      } catch (e) {
        LogUtil.print(e.toString());
      }
    }

    return Database._adapter;
  }

  static Future<ProductBean> getProductBean() async {
    if (Database._productBean == null) {
      await Database.getAdapter().then((adapter) {
        Database._productBean = ProductBean(adapter);
        Database._productBean.createTable(ifNotExists: true);
      });
    }

    return Database._productBean;
  }

  static Future<ProductCategoryBean> getProductCategoryBean() async {
    if (Database._productCategoryBean == null) {
      await Database.getAdapter().then((adapter) {
        Database._productCategoryBean = ProductCategoryBean(adapter);
        Database._productCategoryBean.createTable(ifNotExists: true);
      });
    }

    return Database._productCategoryBean;
  }

  static Future<UserBean> getUserBean() async {
    if (Database._userBean == null) {
      await Database.getAdapter().then((adapter) {
        Database._userBean = UserBean(adapter);
        Database._userBean.createTable(ifNotExists: true);
      });
    }

    return Database._userBean;
  }

  static Future<MerchantPreferencesBean> getMerchantPreferencesBean() async {
    if (Database._merchantPreferencesBean == null) {
      await Database.getAdapter().then((adapter) {
        Database._merchantPreferencesBean = MerchantPreferencesBean(adapter);
        Database._merchantPreferencesBean.createTable(ifNotExists: true);
      });
    }

    return Database._merchantPreferencesBean;
  }
}
