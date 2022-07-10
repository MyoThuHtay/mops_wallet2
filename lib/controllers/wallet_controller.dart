// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:mops_wallet/api/api.dart';
import 'package:mops_wallet/model/coininfo_model.dart';
import 'package:mops_wallet/model/price_model.dart';
import 'package:mops_wallet/model/token_model.dart';
import 'package:mops_wallet/repository/wallet_repo.dart';
import 'package:mops_wallet/utils/constants/constants.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class WalletController extends GetxController {
  final WalletRepo walletRepo;
  final ApiClient apiClient;

  WalletController({required this.walletRepo, required this.apiClient});

  List<TokenModel> _coinList = [];
  List<TokenModel> get coinList => _coinList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List _balanceList = [];
  List get balanceList => _balanceList;

  double _balance = 0;

  double _balances = 0;
  double get balance => _balances;

  List<PriceModel> _priceList = [];
  List<PriceModel> get priceList => _priceList;

  List<CoinInfoModel> _coinInfos = [];
  List<CoinInfoModel> get coinInfos => _coinInfos;

  List<String> mainNetChains = [
    'bsc',
    'polygon',
    'eth',
  ];
  List<String> testNetChains = [
    'bsc testnet',
    'mumbai',
    'rinkeby',
  ];

  List<CoinInfoModel> _coinInfo = [];
  List<CoinInfoModel> get coinInfo => _coinInfo;

  Future<List<CoinInfoModel>> getCoin(String? address) async {
    final coins = await SharedPreferences.getInstance();
    final mainNet = await SharedPreferences.getInstance();
    bool isMainNet = mainNet.getBool('isMainNet') ?? true;
    _balances = coins.getDouble('balance') ?? 0;
    if (coins.containsKey('$address${isMainNet ? 'main' : 'test'}')) {
      String coin = coins.getString('$address${isMainNet ? 'main' : 'test'}')!;
      _coinInfo = CoinInfoModel.decode(coin);

      update();
    } else {
      getBscTokenList(address);
    }
    _isLoaded = true;
    final String encodeData = CoinInfoModel.encode(_coinInfos);
    coins.setString('$address${isMainNet ? 'main' : 'test'}', encodeData);
    coins.setDouble('balance', _balance);
    update();
    return _coinInfo;
  }

  Future<List<CoinInfoModel>> getBscTokenList(String? address) async {
    final mainNet = await SharedPreferences.getInstance();
    bool isMainNet = mainNet.getBool('isMainNet') ?? true;
    _balance = 0;
    _balanceList = [];
    _priceList = [];
    _coinList = [];
    _coinInfos = [];

    _coinList = await walletRepo.getWalletData(
        address!, isMainNet ? mainNetChains[0] : testNetChains[0]);
    for (int i = 0; i < _coinList.length; i++) {
      _balanceList.add(double.parse(_coinList[i].balance!) /
          pow(10, _coinList[i].decimals!));
      final response = await apiClient.getCoinData(
          '${Constants.priceUrl}${_coinList[i].tokenAddress}/price?chain=${isMainNet ? mainNetChains[0] : testNetChains[0]}');
      _priceList.add(PriceModel.fromJson(response.body));
      _coinInfos.add(CoinInfoModel(
        name: _coinList[i].name,
        symbol: _coinList[i].symbol,
        tokenAddress: _coinList[i].tokenAddress,
        logo:
            'https://myothuhtay.github.io/assets/blockchains/smartchain/assets/0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c/logo.png',
        balance: _balanceList[i],
        decimal: _coinList[i].decimals,
        price: _priceList[i].usdPrice,
        type: 'BEP 20',
      ));
      _balance += _balanceList[i] * _priceList[i].usdPrice;
    }
    await getPolygonTokenList(address);
    await getEthTokenList(address);
    update();
    return _coinInfos;
  }

  Future<List<CoinInfoModel>> getPolygonTokenList(String? address) async {
    final mainNet = await SharedPreferences.getInstance();
    bool isMainNet = mainNet.getBool('isMainNet') ?? true;
    _balanceList = [];
    _priceList = [];
    _coinList = [];

    _coinList = await walletRepo.getWalletData(
        address!, isMainNet ? mainNetChains[1] : testNetChains[1]);
    for (int i = 0; i < _coinList.length; i++) {
      _balanceList.add(double.parse(_coinList[i].balance!) /
          pow(10, _coinList[i].decimals!));
      final response = await apiClient.getCoinData(
          '${Constants.priceUrl}${_coinList[i].tokenAddress}/price?chain=${isMainNet ? mainNetChains[1] : testNetChains[1]}');
      _priceList.add(PriceModel.fromJson(response.body));
      _coinInfos.add(CoinInfoModel(
          type: 'POLYGON',
          name: _coinList[i].name,
          symbol: _coinList[i].symbol,
          tokenAddress: _coinList[i].tokenAddress,
          logo:
              'https://myothuhtay.github.io/assets/blockchains/polygon/assets/0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270/logo.png',
          balance: _balanceList[i],
          decimal: _coinList[i].decimals,
          price: _priceList[i].usdPrice));
      _balance += _balanceList[i] * _priceList[i].usdPrice;
    }
    update();
    return _coinInfos;
  }

  Future<List<CoinInfoModel>> getEthTokenList(String? address) async {
    final mainNet = await SharedPreferences.getInstance();
    bool isMainNet = mainNet.getBool('isMainNet') ?? true;

    _balanceList = [];
    _priceList = [];
    _coinList = [];

    _coinList = await walletRepo.getWalletData(
        address!, isMainNet ? mainNetChains[2] : testNetChains[2]);
    for (int i = 0; i < _coinList.length; i++) {
      _balanceList.add(double.parse(_coinList[i].balance!) /
          pow(10, _coinList[i].decimals!));
      final response = await apiClient.getCoinData(
          '${Constants.priceUrl}${_coinList[i].tokenAddress}/price?chain=${isMainNet ? mainNetChains[2] : testNetChains[2]}');
      _priceList.add(PriceModel.fromJson(response.body));
      _coinInfos.add(CoinInfoModel(
          type: 'ERC 20',
          name: _coinList[i].name,
          symbol: _coinList[i].symbol,
          tokenAddress: _coinList[i].tokenAddress,
          logo:
              'https://myothuhtay.github.io/assets/blockchains/ethereum/assets/0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2/logo.png',
          balance: _balanceList[i],
          decimal: _coinList[i].decimals,
          price: _priceList[i].usdPrice));
      _balance += _balanceList[i] * _priceList[i].usdPrice;
    }
    update();
    return _coinInfos;
  }
}
