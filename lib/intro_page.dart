import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/pages/wallet_create/import_wallet.dart';

import 'intro_page2.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);
//final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('MTOKEN'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              const Center(
                child: Text(
                  'MOPS',
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).scaffoldBackgroundColor),
                ),
                onPressed: () {
                  Get.to(() => const IntroPageTwo());
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 15,
                  child: const Center(
                    child: Text('CREATE WALLET'),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).scaffoldBackgroundColor),
                ),
                onPressed: () {
                  Get.to(() => const ImportWallet());
                  
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 15,
                  child: const Center(
                    child: Text('IMPORT WALLET'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
