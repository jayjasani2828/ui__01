class ServicesInHomePage {
  int? serviceListId;
  int? serviceId;
  String? serviceName;
  String? serviceNameAr;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? isSubCategory;

  ServicesInHomePage(
      {this.serviceListId,
        this.serviceId,
        this.serviceName,
        this.serviceNameAr,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.isSubCategory});

  ServicesInHomePage.fromJson(Map<String, dynamic> json) {
    serviceListId = json['service_list_id'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceNameAr = json['service_name_ar'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSubCategory = json['is_sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_list_id'] = this.serviceListId;
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['service_name_ar'] = this.serviceNameAr;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_sub_category'] = this.isSubCategory;
    return data;
  }
}
