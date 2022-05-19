import 'package:get/get.dart';
import 'package:mops_wallet/model/search_coin_model.dart';
import 'package:mops_wallet/repository/search_repo.dart';


class SearchController extends GetxController {

  final SearchRepo searchRepo;

  SearchController({required this.searchRepo});

  List<SearchCoin> _searchList = [];
  List<SearchCoin> get searchList => _searchList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<List<SearchCoin>>  getSearch(String query) async {

    final response = await searchRepo.getCoinData(query);
    if(response.statusCode == 200) {
      _searchList = [];
      //List<SearchCoin> coin = response.body;
      for(int i =0; i < 20; i++){
        _searchList.add(SearchCoin.fromJson(response.body));

     }
      _isLoaded = true;

      update();
      return _searchList;
    }else {
      _isLoaded = false;
      throw Exception('Can\'t get Coin Info' );
    }
  }
}