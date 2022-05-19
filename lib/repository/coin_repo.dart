import 'package:get/get.dart';
import 'package:mops_wallet/api/coin_api.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class CoinRepo extends GetxService{


  final CoinApi coinApi;

  CoinRepo( {required this.coinApi});



  Future<Response> getCoinData(String address) async {
    return await coinApi.getCoinData(Constants.coinUrl2+address);
  }
}