class TokenModel {
  TokenModel({
    required this.status,
    required this.accessToken,
    required this.refreshToken,
  });
  late final String status;
  late final String accessToken;
  late final String refreshToken;

  TokenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
