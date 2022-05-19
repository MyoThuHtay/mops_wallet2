import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mops_wallet/controllers/search_controller.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/pages/home.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/dependencies/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    Get.find<WalletController>().getTokenList();
    Get.find<SearchController>().getSearch('');
    return GetBuilder<WalletController>(builder: (_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      );
    });
  }
}


