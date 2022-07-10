// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:mops_wallet/api/api.dart';
import 'package:mops_wallet/model/token_model.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class WalletRepo extends GetxService {
  final ApiClient apiClient;

  WalletRepo({required this.apiClient});

  List<TokenModel> _coinList = [];
  List<TokenModel> get coinList => _coinList;

  

  Future<List<TokenModel>> getWalletData(String address, String chain) async {
    
    final response =
        await apiClient.getData(address + Constants.coinUrl + chain);
    if (response.statusCode == 200) {
      _coinList = [];
      _coinList.addAll(List<TokenModel>.from(json
          .decode(response.bodyString!)
          .map((x) => TokenModel.fromJson(x))));
    } else {
      throw Exception('Failed to load Coins');
    }
    return _coinList;
  }

  
}
