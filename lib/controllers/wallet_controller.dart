import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mops_wallet/model/coininfo_model.dart';
import 'package:mops_wallet/model/price_model.dart';
import 'package:mops_wallet/model/token_model.dart';
import 'package:mops_wallet/repository/coin_repo.dart';
import 'package:mops_wallet/repository/wallet_repo.dart';
import 'dart:math';
//import 'package:shared_preferences/shared_preferences.dart';

class WalletController extends GetxController {
  final WalletRepo walletRepo;
  final CoinRepo coinRepo;

  WalletController({required this.walletRepo, required this.coinRepo});

  List<TokenModel> _coinList = [];
  List<TokenModel> get coinList => _coinList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<double> _balanceList = [];
  List<double> get balanceList => _balanceList;

  late double _balance;
  double get balance => _balance;

  List _addressList = [];
  List get addressList => _addressList;

  List<PriceModel?> _priceList = [];
  List<PriceModel?> get priceList => _priceList;

  List<CoinInfoModel> _coinInfos = [];
  List<CoinInfoModel> get coinInfos => _coinInfos;

  List<String?> _logoUrl = [];

  Future<List<CoinInfoModel>> getTokenList() async {
    _coinList = [];
    final response = await walletRepo.getWalletData();
    if (response.statusCode == 200) {
      _coinList.addAll(List<TokenModel>.from(json
          .decode(response.bodyString!)
          .map((x) => TokenModel.fromJson(x))));
      _coinInfos = [];
      _balanceList = [];
      _addressList = [];
      _priceList = [];
      _balance = 0;
      List _val = [];
      _logoUrl = [];
      for (int i = 0; i < coinList.length; i++) {
        _val.add(coinList[i].balance!);
        double decimal =
            double.parse(pow(10, coinList[i].decimals!.toInt()).toString());
        var val2 = double.parse(_val[i]) / decimal;
        _balanceList.add(val2);
        final response = await coinRepo.getCoinData(coinList[i].tokenAddress!);
        _priceList.add(PriceModel.fromJson(response.body));
        _balance += _balanceList[i] * _priceList[i]!.usdPrice!;
        String url =
            'https://myothuhtay.github.io/assets-master/blockchains/smartchain/assets/';
        final response2 =
            await get(Uri.parse(url + '${_coinList[i].tokenAddress}/logo.png'));
        _logoUrl.add(response2.body);
        //print(
        //'https://myothuhtay.github.io/assets-master/master/blockchains/smartchain/assets/${_coinList[i].tokenAddress}/logo.png');
        _coinInfos.add(CoinInfoModel(
            name: _coinList[i].name,
            symbol: _coinList[i].symbol,
            tokenAddress: _coinList[i].tokenAddress,
            logo:
                'https://myothuhtay.github.io/assets/blockchains/smartchain/assets/${_coinList[i].tokenAddress}/logo.png',
            balance: _balanceList[i],
            decimal: _coinList[i].decimals,
            price: _priceList[i]!.usdPrice));
      }
    } else {
      throw Exception('Failed to load Coins');
    }
    _isLoaded = true;
    update();
    return _coinInfos;
  }
}
