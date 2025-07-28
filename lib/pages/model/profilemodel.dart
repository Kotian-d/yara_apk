class ProfileModel {
  ProfileModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.pincode,
    required this.address,
  });
  late final String name;
  late final String email;
  late final int mobile;
  late final int pincode;
  late final String address;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    pincode = json['pincode'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['pincode'] = pincode;
    data['address'] = address;
    return data;
  }
}
