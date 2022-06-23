import 'package:get/get.dart';
import 'package:mops_wallet/model/exchange_model.dart';
import 'package:mops_wallet/repository/exchange_repo.dart';

class ExchangeController extends GetxController {
  final ExchangeRepo exchangeRepo;
  ExchangeController({required this.exchangeRepo});

  List<ExchangeModel> _exchangeList = [];
  List<ExchangeModel> get exchangeList => _exchangeList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final List exchange = [
    'aave',
    'uniswap',
    'pancakeswap_new',
    'sushiswap',
    "one_inch_liquidity_protocol_bsc",
    'apeswap',
    'anyswap',
    'auroraswap'
  ];

  Future<List<ExchangeModel>> getExchangeList() async {
    _exchangeList = [];
    //List<SearchCoin> coin = response.body;
    for (int i = 0; i < exchange.length; i++) {
      final response = await exchangeRepo.getExchangeData(exchange[i]);
      if (response.statusCode == 200) {
        _exchangeList.add(ExchangeModel.fromJson(response.body));
      }
      _isLoaded = true;
    }
    update();
    return _exchangeList;
  }
}
