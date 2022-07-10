// ignore_for_file: file_names

import 'dart:convert';

class CoinInfoModel {
  String? type;
  String? name;
  String? symbol;
  String? tokenAddress;
  String? logo;
  dynamic balance;
  num? decimal;
  dynamic price;

  CoinInfoModel(
      {this.type,
      this.name,
      this.symbol,
      this.tokenAddress,
      this.logo,
      this.balance,
      this.decimal,
      this.price});

  CoinInfoModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    name = json['name'] ?? '';
    symbol = json['symbol'] ?? '';
    tokenAddress = json['tokenAddress'] ?? '';
    logo = json['logo'] ?? '';
    balance = json['balance'] ?? 0.0;
    decimal = json['decimal'] ?? 18;
    price = json['price'] ?? 0.0;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['symbol'] = symbol;
    data['tokenAddress'] = tokenAddress;
    data['logo'] = logo;
    data['balance'] = balance;
    data['decimal'] = decimal;
    data['price'] = price;
    return data;
  }

  static String encode(List<CoinInfoModel> coininfos) => json
      .encode(coininfos.map<Map<String, dynamic>>((e) => e.toMap()).toList());

  static List<CoinInfoModel> decode(String coinInfos) =>
      (json.decode(coinInfos) as List<dynamic>)
          .map<CoinInfoModel>((item) => CoinInfoModel.fromJson(item))
          .toList();
}
