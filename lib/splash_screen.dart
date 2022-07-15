import 'dart:async';
import 'package:mops_wallet/controllers/wallet_create_controller.dart';
import 'package:mops_wallet/intro_page.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/exchange_controller.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/pages/home.dart';
import 'package:mops_wallet/pages/wallet_create/pin_login.dart';
import 'package:mops_wallet/repository/wallet_database_repo.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogging = true;
  List<Wallets>? wallets;
  Wallets? walle;
  bool isLoading = false;

  readWallet() async {
    wallets = await WalletDatabase.instance.readAllWallets();
    final walletid = await SharedPreferences.getInstance();
    

    if (wallets!.isNotEmpty) {
      int? id = walletid.getInt('WalletId') ?? wallets?.first.id;
      walle = await Get.find<WalletCreateController>().getWallet(id!);
      Get.find<WalletController>().getCoin(walle?.eth);
      startTimer(30);
      //Get.find<WalletController>().getBscTokenList(walle?.eth);

      isLoading = true;
    } else {
      isLoading = false;
      startTimer(5);
    }
  }

  readUser() async {
    final user = await SharedPreferences.getInstance();
    isLogging = user.getBool('isLogging') ?? false;
  }

  startTimer(int t) async {
    var duration =  Duration(seconds: t);

    return Timer(duration, route);
  }

  void route() {
    Get.off(
        () => isLogging
            ? LogIn(
                wallet: Wallets(
                  id: walle!.id,
                  phrase: walle!.phrase.toString(),
                  private: walle!.private.toString(),
                  btc: walle!.btc.toString(),
                  eth: walle!.eth.toString(),
                  etc: walle!.etc.toString(),
                  vet: walle!.vet.toString(),
                  via: walle!.via.toString(),
                  go: walle!.go.toString(),
                  grs: walle!.grs.toString(),
                  ltc: walle!.ltc.toString(),
                  dgb: walle!.dgb.toString(),
                  poa: walle!.poa.toString(),
                  aion: walle!.aion.toString(),
                  theta: walle!.theta.toString(),
                  tomo: walle!.tomo.toString(),
                  tt: walle!.tt.toString(),
                  clo: walle!.clo.toString(),
                  wan: walle!.wan.toString(),
                  xpud: walle!.xpud.toString(),
                  wallets: walle!.wallets,
                  isCreated: walle!.isCreated,
                ),
              )
            : isLoading
                ? MyHomePage(
                    wallet: Wallets(
                      id: walle!.id,
                      phrase: walle!.phrase.toString(),
                      private: walle!.private.toString(),
                      btc: walle!.btc.toString(),
                      eth: walle!.eth.toString(),
                      etc: walle!.etc.toString(),
                      vet: walle!.vet.toString(),
                      via: walle!.via.toString(),
                      go: walle!.go.toString(),
                      grs: walle!.grs.toString(),
                      ltc: walle!.ltc.toString(),
                      dgb: walle!.dgb.toString(),
                      poa: walle!.poa.toString(),
                      aion: walle!.aion.toString(),
                      theta: walle!.theta.toString(),
                      tomo: walle!.tomo.toString(),
                      tt: walle!.tt.toString(),
                      clo: walle!.clo.toString(),
                      wan: walle!.wan.toString(),
                      xpud: walle!.xpud.toString(),
                      wallets: walle!.wallets,
                      isCreated: walle!.isCreated,
                    ),
                  )
                : const IntroPage(),
        transition: Transition.zoom);
  }

  @override
  void initState() {
    readWallet();
    readUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<WalletCreateController>();
    //Get.find<WalletController>().getCoin(walle?.eth);
    Get.find<SearchController>().getSearch('coin');
    Get.find<ExchangeController>().getExchangeList();
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/mops.png",
              width: 200,
              height: 200,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Text(
              'MOPS',
              style: TextStyle(fontSize: 50.0, color: Colors.blueAccent),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: AppColors.mainColor,
            )
          ],
        ),
      ),
    );
  }
}
