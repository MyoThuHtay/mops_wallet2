// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/pages/wallet/token_balance_view.dart';
import 'package:mops_wallet/pages/wallet/token_detail.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:mops_wallet/utils/text_and_icon.dart';

class Tokens extends StatefulWidget {
  const Tokens({Key? key}) : super(key: key);

  @override
  State<Tokens> createState() => _TokensState();
}

class _TokensState extends State<Tokens> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      builder: (coin) {
        //Future.delayed(Duration(seconds: 5));
        return coin.isLoaded
            ? ListView.builder(
                itemCount: coin.coinInfos.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    double allTotal = coin.balance;
                    return ListTile(
                      tileColor: AppColors.appBarColor,
                      title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.screenHeight / 3.34,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                            FittedBox(
                                fit: BoxFit.contain,
                                child: coin.isLoaded
                                    ? Text(
                                        '\$ ${allTotal.toStringAsFixed(2)} ',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )
                                    : Text(
                                        '\$ 0 ',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      )),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              child: Text(
                                'Wallet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.font14,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height45,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextIcon(
                                    onTap: () {},
                                    conColor: AppColors.conColor,
                                    icon: CupertinoIcons.arrow_up_to_line,
                                    text: 'Send',
                                    iconColor: AppColors.iconColor0,
                                    iconSize: Dimensions.iconSize24),
                                SizedBox(
                                  width: Dimensions.width45,
                                ),
                                TextIcon(
                                    onTap: () {},
                                    conColor: AppColors.conColor,
                                    icon: CupertinoIcons.arrow_down_to_line,
                                    text: 'Receive',
                                    iconColor: AppColors.iconColor0,
                                    iconSize: Dimensions.iconSize24),
                                SizedBox(
                                  width: Dimensions.width45,
                                ),
                                TextIcon(
                                    onTap: () {},
                                    conColor: AppColors.conColor,
                                    icon: CupertinoIcons.bookmark,
                                    text: 'BUY',
                                    iconColor: AppColors.iconColor0,
                                    iconSize: Dimensions.iconSize24),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  index -= 1;
                  String? name = coin.coinInfos[index].name!;
                  String symbol = coin.coinInfos[index].symbol!;
                  String? imageUrl = coin.coinInfos[index].logo!;
                  double? price = coin.coinInfos[index].price;
                  double changePercentage = 1;
                  int? amount = coin.coinInfos[index].balance!.toInt();
                  double? total = price! * amount;

                  String tokenAddress = coin.coinList[index].tokenAddress!;
                  return TokenBalanceView(
                    amount: amount.toDouble(),
                    imageUrl: imageUrl ,
                    name: name,
                    price: price,
                    changePercentage: changePercentage,
                    symbol: symbol,
                    total: total,
                    onTap: () {
                      //print(coin.coinList[index].tokenAddress);
                      Get.to(
                        () => TokenDetail(
                          amount: amount.toDouble(),
                          imageUrl: imageUrl,
                          name: name,
                          price: price,
                          changePercentage: changePercentage,
                          symbol: symbol,
                          total: total,
                          tokenAddress: tokenAddress,
                        ),
                      );
                    },
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  semanticsLabel: 'Loading...',
                ),
              );
      },
    );
  }
}
