// ignore_for_file: file_names

class CoinInfoModel {
  String? name;
  String? symbol;
  String? tokenAddress;
  String? logo;
  double? balance;
  num? decimal;
  double? price;

  CoinInfoModel(
      {this.name,
      this.symbol,
      this.tokenAddress,
      this.logo,
      this.balance,
      this.decimal,
      this.price});

  CoinInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    symbol = json['symbol'] ?? '';
    tokenAddress = json['tokenAddress'] ?? '';
    logo = json['logo'] ?? '';
    balance = json['balance'] ?? 0.0;
    decimal = json['decimal'] ?? 18;
    price = json['price'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['tokenAddress'] = tokenAddress;
    data['logo'] = logo;
    data['balance'] = balance;
    data['decimal'] = decimal;
    data['price'] = price;
    return data;
  }
}
