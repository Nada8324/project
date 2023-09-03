class Product {
  late bool status;
  late ProductDetails data;
  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = ProductDetails.fromJson(json['data']);
  }
}

class ProductDetails {
  List<ProductModel> products = [];

  ProductDetails.fromJson(Map<String, dynamic> json) {
    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class ProductModel {
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic image;
  late String name;
  dynamic discount;
  bool incart = false;
  bool infav = false;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    old_price = json['old_price'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
  }
}
