class UserModel {
  int? id;
  String? firstname;
  String? lastname;
  String? mobileNo;
  String? email;
  String? profileImage;
  String? roleId;
  String? userType;
  String? address;
  String? website;
  String? bankName;
  String? bankAccountNumber;
  String? bankAccountName;
  String? bankRoutingNumber;
  String? comission;

  UserModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.mobileNo,
      this.email,
      this.profileImage,
      this.roleId,
      this.userType,
      this.address,
      this.website,
      this.bankName,
      this.bankAccountNumber,
      this.bankAccountName,
      this.bankRoutingNumber,
      this.comission});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    profileImage = json['profile_image'];
    roleId = json['role_id'];
    userType = json['user_type'];
    address = json['address'];
    website = json['website'];
    bankName = json['bank_name'];
    bankAccountNumber = json['bank_account_number'];
    bankAccountName = json['bank_account_name'];
    bankRoutingNumber = json['bank_routing_number'];
    comission = json['comission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['role_id'] = this.roleId;
    data['user_type'] = this.userType;
    data['address'] = this.address;
    data['website'] = this.website;
    data['bank_name'] = this.bankName;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_account_name'] = this.bankAccountName;
    data['bank_routing_number'] = this.bankRoutingNumber;
    data['comission'] = this.comission;
    return data;
  }
}