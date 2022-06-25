// ignore: file_names
// ignore_for_file: prefer_typing_uninitialized_variables

class PriceModel {
  NativePrice? nativePrice;
  var usdPrice;
  String? exchangeAddress;
  String? exchangeName;

  PriceModel(
      {this.nativePrice,
      this.usdPrice = 0,
      this.exchangeAddress,
      this.exchangeName});

  PriceModel.fromJson(Map<String, dynamic> json) {
    nativePrice = json['nativePrice'] != null
        ? NativePrice.fromJson(json['nativePrice'])
        : null;
    usdPrice = json['usdPrice'] ?? 0.0;
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
