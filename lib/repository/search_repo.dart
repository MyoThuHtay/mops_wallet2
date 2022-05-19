import 'package:get/get.dart';
import 'package:mops_wallet/api/search_api.dart';
import 'package:mops_wallet/utils/constants/constants.dart';

class SearchRepo extends GetxService{


  final SearchApi searchApi;

  SearchRepo( {required this.searchApi});



  Future<Response> getCoinData(String query) async {
    return await searchApi.getCoinData(Constants.search+query);
  }
}