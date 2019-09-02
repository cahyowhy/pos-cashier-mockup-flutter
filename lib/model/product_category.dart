import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

import 'product.dart';
part 'product_category.jorm.dart';

class ProductCategory {
  @PrimaryKey(auto: true)
  int id;

  @Column(length: 20)
  String name;

  @Column()
  String keterangan;

  @BelongsTo(ProductBean)
  int productId;

  ProductCategory({this.name, this.id});
  ProductCategory.make(this.name, this.id);

  static List<ProductCategory> fakerizes() {
    List<String> categories = [
      "KATEGORI A",
      "KATEGORI B",
      "KATEGORI C",
      "KATEGORI D",
      "KATEGORI E"
    ];
    List<ProductCategory> productCategories = [];

    categories
        .forEach((c) => productCategories.add(ProductCategory(name: c, id: 0)));
    return productCategories;
  }
}

@GenBean()
class ProductCategoryBean extends Bean<ProductCategory>
    with _ProductCategoryBean {
  ProductBean _postBean;

  ProductBean get postBean => _postBean ??= new ProductBean(adapter);

  ProductCategoryBean(Adapter adapter) : super(adapter);

  final String tableName = 'product_categories';

  @override
  // TODO: implement productBean
  ProductBean get productBean => null;
}
