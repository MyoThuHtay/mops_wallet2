// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/pages/wallet/finance.dart';
import 'package:mops_wallet/pages/wallet/nft.dart';
import 'package:mops_wallet/pages/wallet/search_coin.dart';
import 'package:mops_wallet/pages/wallet/tokens.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:get/get.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key, required this.wallet}) : super(key: key);
  final Wallets wallet;
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final wallet = widget.wallet;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).appBarTheme.backgroundColor!.withOpacity(0.5),
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell),
            iconSize: Dimensions.iconSize24,
            color: AppColors.iconColor0,
          ),
          centerTitle: true,
          toolbarHeight: kToolbarHeight,
          title: Container(
            width: width,
            height: height / 20,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black26),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                color: Colors.black12),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Theme.of(context).focusColor,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              tabs: [
                Tab(
                  child: SizedBox(
                    width: width,
                    child: Text(
                      'Tokens',
                      style: TextStyle(fontSize: Dimensions.font20 / 2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Finance',
                      style: TextStyle(fontSize: Dimensions.font20 / 2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'NFT',
                      style: TextStyle(fontSize: Dimensions.font20 / 2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => SearchCoin());
              },
              icon: SvgPicture.asset(
                'assets/images/sliders-h-solid.svg',
                color: Colors.white,
                width: Dimensions.iconSize24,
                height: Dimensions.iconSize24,
              ),
            ),
            SizedBox(
              width: Dimensions.width20,
            )
          ],
        ),
        body: TabBarView(
          children: [
            Tokens(
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
            Finance(
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
            NFT(
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
            )
          ],
        ),
      ),
    );
  }
}
