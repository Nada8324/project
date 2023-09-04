class Productbycategory {
  late bool status;
  late ProductbycategoryDetails data;
  Productbycategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = ProductbycategoryDetails.fromJson(json['data']);
  }
}

class ProductbycategoryDetails {
  List<ProductbycategoryModel> products = [];

  ProductbycategoryDetails.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      products.add(ProductbycategoryModel.fromJson(element));
    });
  }
}

class ProductbycategoryModel {
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic image;
  late String name;
  dynamic discount;
  bool incart = false;
  bool infav = false;

  ProductbycategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    old_price = json['old_price'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
  }
}
