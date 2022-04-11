class OffersAndPackegesModel {
  List<Offer>? offer;

  OffersAndPackegesModel({this.offer});

  OffersAndPackegesModel.fromJson(Map<String, dynamic> json) {
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(new Offer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offer != null) {
      data['offer'] = this.offer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offer {
  int? productId;
  String? productName;
  String? productNameAr;
  String? description;
  String? descriptionAr;
  List<ProductImage>? productImage;
  int? isOffer;
  int? isPackage;
  int? discount;
  int? rate;

  Offer(
      {this.productId,
      this.productName,
      this.productNameAr,
      this.description,
      this.descriptionAr,
      this.productImage,
      this.isOffer,
      this.isPackage,
      this.discount,
      this.rate});

  Offer.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(new ProductImage.fromJson(v));
      });
    }
    isOffer = json['is_offer'];
    isPackage = json['is_package'];
    discount = json['discount'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['description'] = this.description;
    data['description_ar'] = this.descriptionAr;
    if (this.productImage != null) {
      data['product_image'] =
          this.productImage!.map((v) => v.toJson()).toList();
    }
    data['is_offer'] = this.isOffer;
    data['is_package'] = this.isPackage;
    data['discount'] = this.discount;
    data['rate'] = this.rate;
    return data;
  }
}

class ProductImage {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductImage(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
