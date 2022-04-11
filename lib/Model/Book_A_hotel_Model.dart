class ServiceCategoryModel {
  int? subServiceId;
  int? serviceListId;
  String? subServiceName;
  String? subServiceNameAr;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;

  ServiceCategoryModel(
      {this.subServiceId,
      this.serviceListId,
      this.subServiceName,
      this.subServiceNameAr,
      this.createdAt,
      this.updatedAt,
      this.products});

  ServiceCategoryModel.fromJson(Map<String, dynamic> json) {
    subServiceId = json['sub_service_id'];
    serviceListId = json['service_list_id'];
    subServiceName = json['sub_service_name'];
    subServiceNameAr = json['sub_service_name_ar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_service_id'] = this.subServiceId;
    data['service_list_id'] = this.serviceListId;
    data['sub_service_name'] = this.subServiceName;
    data['sub_service_name_ar'] = this.subServiceNameAr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  String? productNameAr;
  String? address;
  String? addressAr;
  String? latitude;
  String? longitude;
  String? description;
  String? descriptionAr;
  int? rate;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  int? serviceId;
  int? serviceListId;
  int? subServiceId;
  int? isEcommerce;
  Null? sizeId;
  Null? color;
  String? productImage;
  String? productType;
  int? isOffer;
  int? isPackage;
  int? categoryId;
  Null? discount;
  Null? isBanner;
  int? tax;
  int? rating;

  Products(
      {this.productId,
      this.productName,
      this.productNameAr,
      this.address,
      this.addressAr,
      this.latitude,
      this.longitude,
      this.description,
      this.descriptionAr,
      this.rate,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.serviceId,
      this.serviceListId,
      this.subServiceId,
      this.isEcommerce,
      this.sizeId,
      this.color,
      this.productImage,
      this.productType,
      this.isOffer,
      this.isPackage,
      this.categoryId,
      this.discount,
      this.isBanner,
      this.tax,
      this.rating});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    address = json['address'];
    addressAr = json['address_ar'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    rate = json['rate'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceId = json['service_id'];
    serviceListId = json['service_list_id'];
    subServiceId = json['sub_service_id'];
    isEcommerce = json['is_ecommerce'];
    sizeId = json['size_id'];
    color = json['color'];
    productImage = json['product_image'];
    productType = json['product_type'];
    isOffer = json['is_offer'];
    isPackage = json['is_package'];
    categoryId = json['category_id'];
    discount = json['discount'];
    isBanner = json['is_banner'];
    tax = json['tax'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['address'] = this.address;
    data['address_ar'] = this.addressAr;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    data['rate'] = this.rate;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['service_id'] = this.serviceId;
    data['service_list_id'] = this.serviceListId;
    data['sub_service_id'] = this.subServiceId;
    data['is_ecommerce'] = this.isEcommerce;
    data['size_id'] = this.sizeId;
    data['color'] = this.color;
    data['product_image'] = this.productImage;
    data['product_type'] = this.productType;
    data['is_offer'] = this.isOffer;
    data['is_package'] = this.isPackage;
    data['category_id'] = this.categoryId;
    data['discount'] = this.discount;
    data['is_banner'] = this.isBanner;
    data['tax'] = this.tax;
    data['rating'] = this.rating;
    return data;
  }
}
