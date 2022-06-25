import 'dart:convert';
import 'package:get/get.dart';
import 'package:mops_wallet/model/coininfo_model.dart';
import 'package:mops_wallet/model/price_model.dart';
import 'package:mops_wallet/model/token_model.dart';
import 'package:mops_wallet/repository/wallet_repo.dart';
import 'dart:math';

class WalletController extends GetxController {
  final WalletRepo walletRepo;

  WalletController({required this.walletRepo});

  List<TokenModel> _coinList = [];
  List<TokenModel> get coinList => _coinList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List _balanceList = [];
  List get balanceList => _balanceList;

  late double _balance;
  double get balance => _balance;

  List<PriceModel?> _priceList = [];
  List<PriceModel?> get priceList => _priceList;

  List<CoinInfoModel> _coinInfos = [];
  List<CoinInfoModel> get coinInfos => _coinInfos;

  String address = '0xe887232387645c90601935fc028d0589d97942eb';

  List<String> chains = ['bsc', 'polygon', 'eth', 'fantom', 'cronos'];

  Future<List<CoinInfoModel>> getBscTokenList() async {
    _balanceList = [];
    _priceList = [];
    _balance = 0;
    List _val = [];
    _coinList = [];
    _coinInfos = [];
    final response = await walletRepo.getWalletData(address, chains[0]);

    if (response.statusCode == 200) {
      _coinList.addAll(List<TokenModel>.from(json
          .decode(response.bodyString!)
          .map((x) => TokenModel.fromJson(x))));

      for (int i = 0; i < coinList.length; i++) {
        _val.add(coinList[i].balance!);
        double decimal =
            double.parse(pow(10, coinList[i].decimals!.toInt()).toString());
        var val2 = double.parse(_val[i]) / decimal;
        _balanceList.add(val2);
        final response =
            await walletRepo.getCoinData(coinList[i].tokenAddress!, chains[0]);
        _priceList.add(PriceModel.fromJson(response.body));
        _balance += _balanceList[i] * _priceList[i]!.usdPrice!;
        _coinInfos.add(CoinInfoModel(
            name: _coinList[i].name,
            symbol: _coinList[i].symbol,
            tokenAddress: _coinList[i].tokenAddress,
            logo:
                'https://myothuhtay.github.io/assets/blockchains/smartchain/assets/0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c/logo.png',
            balance: _balanceList[i],
            decimal: _coinList[i].decimals,
            price: _priceList[i]!.usdPrice!));
      }
    } else {
      throw Exception('Failed to load Coins');
    }
    getPolygonTokenList();
    _isLoaded = true;
    update();
    return _coinInfos;
  }

  Future<List<CoinInfoModel>> getPolygonTokenList() async {
    _coinList = [];
    _balanceList = [];
    _priceList = [];
    List _val = [];
    final response = await walletRepo.getWalletData(address, chains[1]);

    if (response.statusCode == 200) {
      _coinList.addAll(List<TokenModel>.from(json
          .decode(response.bodyString!)
          .map((x) => TokenModel.fromJson(x))));

      for (int i = 0; i < coinList.length; i++) {
        _val.add(coinList[i].balance!);
        double decimal =
            double.parse(pow(10, coinList[i].decimals!.toInt()).toString());
        var val2 = double.parse(_val[i]) / decimal;
        _balanceList.add(val2);
        final response =
            await walletRepo.getCoinData(coinList[i].tokenAddress!, chains[1]);
        _priceList.add(PriceModel.fromJson(response.body));
        _balance += _balanceList[i] * _priceList[i]!.usdPrice!;
        _coinInfos.add(CoinInfoModel(
            name: _coinList[i].name,
            symbol: _coinList[i].symbol,
            tokenAddress: _coinList[i].tokenAddress,
            logo:
                'https://myothuhtay.github.io/assets/blockchains/polygon/assets/0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270/logo.png',
            balance: _balanceList[i],
            decimal: _coinList[i].decimals,
            price: _priceList[i]!.usdPrice!));
      }
    } else {
      throw Exception('Failed to load Coins');
    }
    getEthTokenList();
    _isLoaded = true;
    update();
    return _coinInfos;
  }

  Future<List<CoinInfoModel>> getEthTokenList() async {
    _coinList = [];
    _balanceList = [];
    _priceList = [];
    List _val = [];
    final response = await walletRepo.getWalletData(address, chains[2]);

    if (response.statusCode == 200) {
      _coinList.addAll(List<TokenModel>.from(json
          .decode(response.bodyString!)
          .map((x) => TokenModel.fromJson(x))));

      for (int i = 0; i < coinList.length; i++) {
        _val.add(coinList[i].balance!);
        double decimal =
            double.parse(pow(10, coinList[i].decimals!.toInt()).toString());
        var val2 = double.parse(_val[i]) / decimal;
        _balanceList.add(val2);
        final response =
            await walletRepo.getCoinData(coinList[i].tokenAddress!, chains[2]);
        _priceList.add(PriceModel.fromJson(response.body));
        _balance += _balanceList[i] * _priceList[i]!.usdPrice!.toDouble();
        _coinInfos.add(CoinInfoModel(
            name: _coinList[i].name,
            symbol: _coinList[i].symbol,
            tokenAddress: _coinList[i].tokenAddress,
            logo:
                'https://myothuhtay.github.io/assets/blockchains/ethereum/assets/0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2/logo.png',
            balance: _balanceList[i],
            decimal: _coinList[i].decimals,
            price: _priceList[i]!.usdPrice!.toDouble()));
      }
    } else {
      throw Exception('Failed to load Coins');
    }
    _isLoaded = true;
    update();
    return _coinInfos;
  }
}
