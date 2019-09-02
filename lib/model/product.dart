import 'package:faker/faker.dart';
import 'package:padi_pos_kasir/model/product_category.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:jaguar_query/jaguar_query.dart';

import 'product_category.dart';

part 'product.jorm.dart';

class Product {
  @PrimaryKey(auto: true)
  int id;

  @Column(length: 50)
  String name;

  @Column(isNullable: true)
  String guid;

  @Column(isNullable: true)
  String image;

  @Column()
  int price;

  @Column()
  bool hasPromo;

  @Column(isNullable: true)
  int rating;

  @HasOne(ProductCategoryBean)
  ProductCategory productCategory;

  Product();
  Product.make(
      this.name, this.image, this.id, this.price, this.hasPromo, this.rating);

  static Product fakers() {
    Faker faker = new Faker();
    List<ProductCategory> productCategories = ProductCategory.fakerizes();

    Product product = Product.make(
        faker.food.cuisine(),
        "https://source.unsplash.com/480x480/?food",
        1,
        faker.randomGenerator.integer(150000, min: 5000),
        faker.randomGenerator.boolean(),
        faker.randomGenerator.integer(5, min: 3));

    product.productCategory =
        productCategories[faker.randomGenerator.integer(4, min: 0)];
    product.guid = faker.guid.guid();

    return product;
  }

  static List<Product> fakerizes({int total = 5}) {
    return new List<Product>.generate(total, (i) => Product.fakers());
  }
}

@GenBean()
class ProductBean extends Bean<Product> with _ProductBean {
  ProductBean(Adapter adapter)
      : itemBean = ProductCategoryBean(adapter),
        super(adapter);

  final ProductCategoryBean itemBean;

  final String tableName = 'products';

  @override
  // TODO: implement productCategoryBean
  ProductCategoryBean get productCategoryBean => null;
}
