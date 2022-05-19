import 'package:get/get.dart';
import 'package:mops_wallet/api/exchange_api.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class ExchangeRepo extends GetxService {
  final ExchangeApi exchangeApi;

  ExchangeRepo({required this.exchangeApi});

  Future<Response> getExchangeData(String query) async {
    return await exchangeApi.getExchangeData(Constants.exchange + query);
  }
}
