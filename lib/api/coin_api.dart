import 'package:get/get.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class CoinApi extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  CoinApi({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = Constants.token;
    _mainHeaders = {
      'accept': 'application/json; charset=UTF-8',
      'X-API-Key': token
    };
  }

  Future<Response> getCoinData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);

      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
