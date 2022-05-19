// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mops_wallet/pages/wallet/search_coin.dart';
import 'package:mops_wallet/pages/wallet/tokens.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:get/get.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
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
                border:
                    Border.all(width: 2, color: Colors.black26),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                color: Colors.black12),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.textColor,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(Dimensions.radius20/2),
                color: AppColors.appBarColor,
              ),
              tabs: [
                Tab(
                    child: SizedBox(
                  width: width,
                  child: Text(
                    'Tokens',
                    style: TextStyle(fontSize: Dimensions.font20/2),
                    textAlign: TextAlign.center,
                  ),
                ),),
                Tab(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Finance',
                      style: TextStyle(fontSize: Dimensions.font20/2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'NFT',
                      style: TextStyle(fontSize: Dimensions.font20/2),
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
            Tokens(),
            Text(
              'B',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: Dimensions.font20),
            ),
            Text(
              'C',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: Dimensions.font20),
            ),
          ],
        ),
      ),
    );
  }
}
