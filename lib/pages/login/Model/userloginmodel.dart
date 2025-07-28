class UsersLoginModel {
  UsersLoginModel({required this.mobile, required this.password});

  final String? mobile;
  final String? password;

  factory UsersLoginModel.fromJson(Map<String, dynamic> json) {
    return UsersLoginModel(mobile: json["mobile"], password: json["password"]);
  }

  Map<String, dynamic> toJson() => {"mobile": mobile, "password": password};
}
