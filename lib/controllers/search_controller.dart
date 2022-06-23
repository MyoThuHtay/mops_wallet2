import 'package:get/get.dart';
import 'package:mops_wallet/model/search_coin_model.dart';
import 'package:mops_wallet/repository/search_repo.dart';

class SearchController extends GetxController {
  final SearchRepo searchRepo;

  SearchController({required this.searchRepo});

  List<SearchModel> _searchList = [];
  List<SearchModel> get searchList => _searchList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool _isShow = true;
  bool get isShow => _isShow;

  Future<List<SearchModel>> getSearch(String query) async {
    final response = await searchRepo.getCoinData(query);
    if (response.statusCode == 200) {
      _searchList = [];
      //List<SearchCoin> coin = response.body;
      for (int i = 0;
          i < SearchModel.fromJson(response.body).coins!.length;
          i++) {
        _searchList.add(SearchModel.fromJson(response.body));
        //hideOrShow(i);
      }
      _isLoaded = true;

      update();
      return _searchList;
    } else {
      _isLoaded = false;
      throw Exception('Can\'t get Coin Info');
    }
  }

  hideOrShow(int index) {
    _isShow = true;
  }
}
