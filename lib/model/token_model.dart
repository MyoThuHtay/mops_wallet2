// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

List<TokenModel> tokenModelFromJson(String str) =>
    List<TokenModel>.from(json.decode(str).map((x) => TokenModel.fromJson(x)));

String tokenModelToJson(List<TokenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TokenModel {
  TokenModel({
    this.tokenAddress,
    this.name,
    this.symbol,
    this.decimals,
    this.balance,
  });

  String? tokenAddress;
  String? name;
  String? symbol;

  int? decimals;
  String? balance;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        tokenAddress: json["token_address"],
        name: json["name"],
        symbol: json["symbol"],
        decimals: json["decimals"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "token_address": tokenAddress,
        "name": name,
        "symbol": symbol,
        "decimals": decimals,
        "balance": balance,
      };
}
