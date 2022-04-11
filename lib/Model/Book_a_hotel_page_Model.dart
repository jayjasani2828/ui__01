class Book_a_hotel_page_Model {
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
  String? sizeId;
  String? color;
  String? productImage;
  String? productType;
  int? isOffer;
  int? isPackage;
  int? categoryId;
  String? discount;
  String? isBanner;
  int? tax;
  int? rating;
  List<ProductAvailability>? productAvailability;
  List<ProductImages>? productImages;

  Book_a_hotel_page_Model(
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
        this.rating,
        this.productAvailability,
        this.productImages});

  Book_a_hotel_page_Model.fromJson(Map<String, dynamic> json) {
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
    if (json['product_availability'] != null) {
      productAvailability = <ProductAvailability>[];
      json['product_availability'].forEach((v) {
        productAvailability!.add(new ProductAvailability.fromJson(v));
      });
    }
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
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
    data['is_package'] =  this.isPackage;
    data['category_id'] = this.categoryId;
    data['discount'] = this.discount;
    data['is_banner'] = this.isBanner;
    data['tax'] = this.tax;
    data['rating'] = this.rating;
    if (this.productAvailability != null) {
      data['product_availability'] =
          this.productAvailability!.map((v) => v.toJson()).toList();
    }
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAvailability {
  String? date;
  List<TimeSlote>? timeSlote;

  ProductAvailability({this.date, this.timeSlote});

  ProductAvailability.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['time_slote'] != null) {
      timeSlote = <TimeSlote>[];
      json['time_slote'].forEach((v) {
        timeSlote!.add(new TimeSlote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.timeSlote != null) {
      data['time_slote'] = this.timeSlote!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSlote {
  int? scheduleId;
  String? scheduleDate;
  String? startTime;
  String? endTime;

  TimeSlote({this.scheduleId, this.scheduleDate, this.startTime, this.endTime});

  TimeSlote.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    scheduleDate = json['schedule_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this.scheduleId;
    data['schedule_date'] = this.scheduleDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class ProductImages {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductImages(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProductImages.fromJson(Map<String, dynamic> json) {
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
