import 'package:get/get.dart';

class ExchangeApi extends GetConnect implements GetxService {
  //late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ExchangeApi({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    //token = Constants.token;
    _mainHeaders = {
      'accept': 'application/json; charset=UTF-8',
      // 'X-API-Key': token
    };
  }
  Future<Response> getExchangeData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      // if (kDebugMode) {
      //   print('get Called '+response.statusCode.toString());
      // }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
