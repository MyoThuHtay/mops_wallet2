import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
//import 'package:mops_wallet/utils/constants/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  String? token = dotenv.env['MORALIS_API_KEY'];
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    
    _mainHeaders = {
      'accept': 'application/json; charset=UTF-8',
      'X-API-Key': token!
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri, headers: _mainHeaders);
      
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
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
