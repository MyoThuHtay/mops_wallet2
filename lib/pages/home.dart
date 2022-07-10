// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/pages/dapp/dapp.dart';
import 'package:mops_wallet/pages/setting/setting.dart';
import 'package:mops_wallet/pages/swap/dex.dart';
import 'package:mops_wallet/pages/wallet/wallet.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.wallet}) : super(key: key);
  final Wallets wallet;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    Get.find<WalletController>().getBscTokenList(widget.wallet.eth);
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final wallet = widget.wallet;
    List<Widget> _buildScreens() {
      return [
        Wallet(
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
        Dapp(
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
        Dex(),
        Setting(
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
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.cube),
          title: ("DAPP"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.creditcard_fill),
          title: ("SWAP"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: ("Setting"),
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor:
          Theme.of(context).primaryColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
      // Choose the nav bar style with this property.
    );
  }
}
