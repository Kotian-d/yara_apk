class SignUpModel {
  SignUpModel({
    required this.name,
    required this.mobile,
    required this.shopname,
    required this.email,
    required this.state,
    required this.password,
    required this.confirmPassword,
  });
  late final String name;
  late final String mobile;
  late final String shopname;
  late final String email;
  late final String state;
  late final String password;
  late final String confirmPassword;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    shopname = json['shopname'];
    email = json['email'];
    state = json['state'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['mobile'] = mobile;
    data['shopname'] = shopname;
    data['email'] = email;
    data['state'] = state;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
