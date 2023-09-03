class Category {
  late bool status;
  late CategoryDetails data;
  Category.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoryDetails.fromJson(json['data']);
  }
}

class CategoryDetails {
  List<CategoryModel> category = [];

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      category.add(CategoryModel.fromJson(element));
    });
  }
}

class CategoryModel {
  late int id;
  late dynamic image;
  late String name;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
