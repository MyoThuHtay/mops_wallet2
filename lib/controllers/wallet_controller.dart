import 'dart:convert';
import 'package:get/get.dart';
import 'package:mops_wallet/model/coin_model.dart';
import 'package:mops_wallet/model/token_balance_model.dart';
import 'package:mops_wallet/repository/coin_repo.dart';
import 'package:mops_wallet/repository/wallet_repo.dart';
import 'dart:math';

class WalletController extends GetxController {
  final WalletRepo walletRepo;
  final CoinRepo coinRepo;

  WalletController({required this.walletRepo, required this.coinRepo});

  List<TokenModel> _coinList = [];
  List<TokenModel> get coinList => _coinList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  // bool _isLoaded2 = false;
  // bool get isLoaded2 => _isLoaded2;

  List<double> _balanceList = [];
  List<double> get balanceList => _balanceList;

  double _balance = 0;
  double get balance => _balance;

  List _addressList = [];
  List get addressList => _addressList;

  List<CoinModel> _tokenList = [];
  List<CoinModel> get tokenList => _tokenList;

  Future<List<TokenModel>> getTokenList() async {
    //_coinList = [];
    final response = await walletRepo.getWalletData();
    if (response.statusCode == 200) {
      _coinList = [];
      _coinList.addAll(List<TokenModel>.from(json
          .decode(response.bodyString!)
          .map((x) => TokenModel.fromJson(x))));
      getTokenBalanceList(_coinList);
      getTokenData();
      _isLoaded = true;
      update();
      return _coinList;
    } else {
      throw Exception('Failed to load Coins');
    }
  }

  getTokenBalanceList(List<TokenModel> coinList) {
    _balanceList = [];
    _addressList = [];
    _balance = 0;
    List _val = [];
    for (int i = 0; i < coinList.length; i++) {
      _val.add(coinList[i].balance!);
      double decimal =
          double.parse(pow(10, coinList[i].decimals!.toInt()).toString());
      var val2 = double.parse(_val[i]) / decimal;
      _balanceList.add(val2);
      _balance += _balanceList[i] * 0.5;
    }
    return _balanceList;
  }

  Future<List<CoinModel>> getTokenData() async {
    double balance2 = 0;
    _tokenList = [];
    for (int i = 0; i < coinList.length; i++) {
      final response = await coinRepo.getCoinData(coinList[i].tokenAddress!);
      if (response.statusCode == 200) {
        _tokenList.addNonNull(CoinModel.fromJson(response.body));
        // balance2 +=
        //     _balanceList[i] * _tokenList[i].marketData!.currentPrice!.usd!;
        //print(_tokenList[i].symbol);
      }

      //print(balance2.toString());
    }
    return _tokenList;
  }
}
