// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/exchange_controller.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/pages/dapp/dapp_view.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Dapp extends StatefulWidget {
  const Dapp({Key? key, required this.wallet}) : super(key: key);
  final Wallets wallet;
  @override
  DappState createState() => DappState();
}

class DappState extends State<Dapp> {
  final myController = TextEditingController();
  String data = '';

  void _launchUrL(String url) async {
    String url = myController.text;
    if (await canLaunchUrl(Uri.parse('https://$url'))) {
      await launchUrl(Uri.parse('https://$url'),
          mode: LaunchMode.platformDefault,
          webOnlyWindowName: "_blank",
          webViewConfiguration:
              const WebViewConfiguration(enableJavaScript: true));
    } else {
      throw 'Could not launch $url';
    }
    //return url;
  }

  @override
  void dispose() {
    myController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            showCursor: true,
            cursorColor: Colors.black38,
            controller: myController,
            enableSuggestions: true,
            onFieldSubmitted: (text) {
              _launchUrL(
                text,
              );
            },
            decoration: InputDecoration(
              //focusColor: Theme.of(context).primaryColor,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              hintText: '  Search or enter url',
              suffixIcon: TextButton(
                onPressed: () {
                  _launchUrL(myController.text);
                },
                child: Text(
                  'Go',
                  style: TextStyle(color: AppColors.mainColor, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: GetBuilder<ExchangeController>(
        builder: (controller) => ListView.builder(
          itemCount: controller.exchangeList.length,
          itemBuilder: (context, index) {
            return DappView(
              url: controller.exchangeList[index].url!,
              name: controller.exchangeList[index].name!,
              description: controller.exchangeList[index].description,
              image: controller.exchangeList[index].image!,
            );
          },
        ),
      ),
    );
  }
}
