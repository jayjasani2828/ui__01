class ContectUsModel {
  int? id;
  String? companyName;
  String? appVersion;
  String? phoneNumber;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? facebook;
  String? instagram;
  String? youtube;
  String? twitter;
  String? linkedin;

  ContectUsModel(
      {this.id,
        this.companyName,
        this.appVersion,
        this.phoneNumber,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.facebook,
        this.instagram,
        this.youtube,
        this.twitter,
        this.linkedin});

  ContectUsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    appVersion = json['app_version'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['app_version'] = this.appVersion;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    return data;
  }
}
