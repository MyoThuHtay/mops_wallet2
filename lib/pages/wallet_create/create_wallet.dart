// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/intro_page.dart';
import 'package:mops_wallet/pages/home.dart';
import 'package:mops_wallet/pages/wallet_create/wallet_detail.dart';
import 'package:mops_wallet/repository/wallet_database_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateWallet extends StatefulWidget {
  const CreateWallet({Key? key}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWallet();
}

class _CreateWallet extends State<CreateWallet> {
  late List<Wallets> wallets;
  bool isLoading = false;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    refreshWallets();
  }

  // @override
  // void dispose() {
  //   WalletDatabase.instance.close();
  //   super.dispose();
  // }
  Wallets? wallet;
  Future refreshWallets() async {
    setState(() {
      isLoading = true;
    });
    wallets = await WalletDatabase.instance.readAllWallets();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //var ids = wallet?.id ?? 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Wallets Information"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(
                () => const IntroPage(
                    //id: ids,
                    ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : wallets.isEmpty
                  ? const Text('No Wallets')
                  : buildWallets()),
    );
  }

  Widget buildWallets() => ListView.builder(
        itemCount: wallets.length,
        itemBuilder: (context, index) {
          final wallet = wallets[index];

          return ListTile(
            onTap: () async {
              final walletid = await SharedPreferences.getInstance();

              setState(() {
                isSelected = true;
                walletid.setInt('WalletId', wallet.id!);
              });
              Get.find<WalletController>().getBscTokenList(wallet.eth);
              Get.off(
                () => MyHomePage(
                  wallet: Wallets(
                    id: wallet.id,
                    phrase: wallet.phrase.toString(),
                    private: wallet.private.toString(),
                    btc: wallet.btc.toString(),
                    eth: wallet.eth.toString(),
                    etc: wallet.etc.toString(),
                    vet: wallet.vet.toString(),
                    via: wallet.via.toString(),
                    go: wallet.go.toString(),
                    grs: wallet.grs.toString(),
                    ltc: wallet.ltc.toString(),
                    dgb: wallet.dgb.toString(),
                    poa: wallet.poa.toString(),
                    aion: wallet.aion.toString(),
                    theta: wallet.theta.toString(),
                    tomo: wallet.tomo.toString(),
                    tt: wallet.tt.toString(),
                    clo: wallet.clo.toString(),
                    wan: wallet.wan.toString(),
                    xpud: wallet.xpud.toString(),
                    wallets: wallet.wallets,
                    isCreated: wallet.isCreated,
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              child: Image.asset(
                'assets/images/banner.png',
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            title: Text('Wallet ${index + 1}'),
            subtitle: Text(wallet.wallets),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                Get.to(
                  () => WalletDetail(
                    wallet: Wallets(
                      id: wallet.id,
                      phrase: wallet.phrase.toString(),
                      private: wallet.private.toString(),
                      btc: wallet.btc.toString(),
                      eth: wallet.eth.toString(),
                      etc: wallet.etc.toString(),
                      vet: wallet.vet.toString(),
                      via: wallet.via.toString(),
                      go: wallet.go.toString(),
                      grs: wallet.grs.toString(),
                      ltc: wallet.ltc.toString(),
                      dgb: wallet.dgb.toString(),
                      poa: wallet.poa.toString(),
                      aion: wallet.aion.toString(),
                      theta: wallet.theta.toString(),
                      tomo: wallet.tomo.toString(),
                      tt: wallet.tt.toString(),
                      clo: wallet.clo.toString(),
                      wan: wallet.wan.toString(),
                      xpud: wallet.xpud.toString(),
                      wallets: wallet.wallets,
                      isCreated: wallet.isCreated,
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
}
