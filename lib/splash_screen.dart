import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/exchange_controller.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';

import 'pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    //Get.find<WalletController>().getCoinInfo();
    Get.find<WalletController>().getTokenList();
    //Get.find<WalletController>().getTokenPrice();
    Get.find<SearchController>().getSearch('coin');
    Get.find<ExchangeController>().getExchangeList();
    return GetBuilder<WalletController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/banner.png",
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
              ],
            ),
          ),
        );
      },
    );
  }

  void route() {
    Get.off(() => const MyHomePage(), transition: Transition.zoom);
  }
}
