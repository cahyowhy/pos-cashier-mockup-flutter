class ProductCategory {
  int id = 0;
  String name = "";

  ProductCategory({this.name = "", this.id = 0});

  static List<ProductCategory> fakerizes() {
    List<String> categories = [
      "KATEGORI A",
      "KATEGORI B",
      "KATEGORI C",
      "KATEGORI D",
      "KATEGORI E"
    ];
    List<ProductCategory> productCategories = [];

    categories.forEach((c) => productCategories.add(ProductCategory(name: c)));
    return productCategories;
  }
}
