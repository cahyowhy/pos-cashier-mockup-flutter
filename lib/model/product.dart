import 'package:faker/faker.dart';
import 'package:padi_pos_kasir/model/product_category.dart';

class Product {
  int id = 0;
  String name = "";
  String guid = "";
  String image = "";
  int price = 0;
  bool hasPromo = false;
  int rating = 0;
  ProductCategory productCategory = ProductCategory();

  Product(
      {this.name = "",
      this.image = "",
      this.id = 0,
      this.price = 0,
      this.hasPromo = false,
      this.rating = 0});

  static Product fakers() {
    Faker faker = new Faker();
    List<ProductCategory> productCategories = ProductCategory.fakerizes();

    Product product = Product(
        name: faker.food.cuisine(),
        image: "https://source.unsplash.com/480x480/?food",
        price: faker.randomGenerator.integer(150000, min: 5000),
        hasPromo: faker.randomGenerator.boolean(),
        rating: faker.randomGenerator.integer(5, min: 3));

    product.productCategory =
        productCategories[faker.randomGenerator.integer(4, min: 0)];
    product.guid = faker.guid.guid();

    return product;
  }

  static List<Product> fakerizes({int total = 5}) {
    return new List<Product>.generate(total, (i) => Product.fakers());
  }
}
