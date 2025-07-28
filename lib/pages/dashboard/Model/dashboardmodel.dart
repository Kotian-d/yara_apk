class DashboardData {
  DashboardData({
    required this.balance,
    required this.opening,
    required this.purchase,
    required this.sale,
    required this.commission,
  });
  late final int balance;
  late final int opening;
  late final int purchase;
  late final int sale;
  late final int commission;

  DashboardData.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    opening = json['opening'];
    purchase = json['purchase'];
    sale = json['sale'];
    commission = json['commission'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['balance'] = balance;
    data['opening'] = opening;
    data['purchase'] = purchase;
    data['sale'] = sale;
    data['commission'] = commission;
    return data;
  }
}
