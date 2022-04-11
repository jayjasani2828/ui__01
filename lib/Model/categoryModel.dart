class CategoryModel {
  int? categoryId;
  String? categoryName;
  String? categoryNameAr;
  String? image;

  CategoryModel(
      {this.categoryId, this.categoryName, this.categoryNameAr, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameAr = json['category_name_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_ar'] = this.categoryNameAr;
    data['image'] = this.image;
    return data;
  }
}