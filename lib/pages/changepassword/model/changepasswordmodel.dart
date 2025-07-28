class ChangePasswordModel {
  ChangePasswordModel({
    required this.currentpassword,
    required this.newpassword,
    required this.confirmpassword,
  });
  late final String currentpassword;
  late final String newpassword;
  late final String confirmpassword;

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    currentpassword = json['currentpassword'];
    newpassword = json['newpassword'];
    confirmpassword = json['confirmpassword'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currentpassword'] = currentpassword;
    data['newpassword'] = newpassword;
    data['confirmpassword'] = confirmpassword;
    return data;
  }
}
