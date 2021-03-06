import 'package:get/get.dart';

class SearchApi extends GetConnect implements GetxService {
  //late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  SearchApi({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    //token = Constants.token2;
    _mainHeaders = {
      'accept': 'application/json; charset=UTF-8',
    };
  }

  Future<Response> getCoinData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      // if (kDebugMode) {
      //   print('SearchApi get Called ' + response.statusCode.toString());
      // }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
