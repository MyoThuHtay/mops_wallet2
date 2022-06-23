import 'package:mops_wallet/api/api.dart';
import 'package:mops_wallet/api/coin_api.dart';
import 'package:mops_wallet/api/exchange_api.dart';
import 'package:mops_wallet/api/search_api.dart';
import 'package:mops_wallet/controllers/exchange_controller.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/repository/coin_repo.dart';
import 'package:mops_wallet/repository/exchange_repo.dart';
import 'package:mops_wallet/repository/search_repo.dart';
import 'package:mops_wallet/repository/wallet_repo.dart';
import 'package:mops_wallet/utils/constants/constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.baseUrl));
  Get.lazyPut(() => CoinApi(appBaseUrl: Constants.baseUrl));
  Get.lazyPut(() => SearchApi(appBaseUrl: Constants.baseUrl2));
  Get.lazyPut(() => ExchangeApi(appBaseUrl: Constants.baseUrl2));

  //repo
  Get.lazyPut(() => WalletRepo(apiClient: Get.find()));
  Get.lazyPut(() => CoinRepo(coinApi: Get.find()));
  Get.lazyPut(() => SearchRepo(searchApi: Get.find()));
  Get.lazyPut(() => ExchangeRepo(exchangeApi: Get.find()));

  //controller
  Get.lazyPut(
      () => WalletController(walletRepo: Get.find(), coinRepo: Get.find()));
  Get.lazyPut(() => SearchController(searchRepo: Get.find()));
  Get.lazyPut(() => ExchangeController(exchangeRepo: Get.find()));
}
