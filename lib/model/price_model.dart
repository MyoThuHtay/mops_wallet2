// ignore: file_names
class PriceModel {
  NativePrice? nativePrice;
  double? usdPrice;
  String? exchangeAddress;
  String? exchangeName;

  PriceModel(
      {this.nativePrice,
      this.usdPrice,
      this.exchangeAddress,
      this.exchangeName});

  PriceModel.fromJson(Map<String, dynamic> json) {
    nativePrice = json['nativePrice'] != null
        ? NativePrice.fromJson(json['nativePrice'])
        : null;
    usdPrice = json['usdPrice'] ?? 0;
    exchangeAddress = json['exchangeAddress'] ?? '';
    exchangeName = json['exchangeName'] ?? '';
  }
}

class NativePrice {
  String? value;
  int? decimal;
  String? name;
  String? symbol;

  NativePrice({this.value, this.decimal, this.name, this.symbol});

  NativePrice.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    decimal = json['decimal'];
    name = json['name'];
    symbol = json['symbol'];
  }
}
