import 'package:get/get.dart';
import 'package:mops_wallet/api/api.dart';
import 'package:mops_wallet/api/coin_api.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class WalletRepo extends GetxService{

  final ApiClient apiClient;

  WalletRepo( {required this.apiClient});

  Future<Response> getWalletData() async {
    return await apiClient.getData(Constants.coinUrl);
  }
  

}