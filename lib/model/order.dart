import 'package:padi_pos_kasir/model/product.dart';

class Order {
  Product product;
  int total = 0;

  Order({this.product, this.total});

  Map<String, String> toMap() {
    return {"product": product.name, "total": total.toString()};
  }
}
