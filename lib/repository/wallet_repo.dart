import 'package:get/get.dart';
import 'package:mops_wallet/api/api.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class WalletRepo extends GetxService {
  final ApiClient apiClient;

  WalletRepo({required this.apiClient});

 

  Future<Response> getWalletData(String address,String chain) async {
    return await apiClient.getData(address + Constants.coinUrl+chain);
  }

  Future<Response> getCoinData(String tokenAddress,String chain) async {
    return await apiClient
        .getCoinData(Constants.priceUrl + tokenAddress + '/price?chain='+chain);
  }
}
