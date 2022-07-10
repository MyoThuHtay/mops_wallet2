// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/pages/wallet/token_balance_view.dart';
import 'package:mops_wallet/pages/wallet/token_detail.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:mops_wallet/utils/text_and_icon.dart';

class Tokens extends StatefulWidget {
  const Tokens({Key? key, required this.wallet}) : super(key: key);
  final Wallets wallet;
  @override
  State<Tokens> createState() => _TokensState();
}

class _TokensState extends State<Tokens> {
  @override
  void initState() {
    Get.find<WalletController>().getCoin(widget.wallet.eth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double allTotal = 0;
    return GetBuilder<WalletController>(
      builder: (coin) {
        coin.getCoin(widget.wallet.eth);
        allTotal = Get.find<WalletController>().balance;
        return coin.isLoaded
            ? Scaffold(
                backgroundColor: Theme.of(context).primaryColor,
                body: LiquidPullToRefresh(
                  onRefresh: () =>
                      Get.find<WalletController>().getCoin(widget.wallet.eth),
                  child: ListView.builder(
                    itemCount: coin.coinInfo.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ListTile(
                          tileColor: Theme.of(context).scaffoldBackgroundColor,
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
                                    child: Text(
                                      '\$ ${allTotal.toStringAsFixed(2)} ',
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    widget.wallet.wallets,
                                    maxLines: 1,
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
                      String? type = coin.coinInfo[index].type!;
                      String? name = coin.coinInfo[index].name!;
                      String symbol = coin.coinInfo[index].symbol!;
                      String? imageUrl = coin.coinInfo[index].logo!;
                      dynamic price = coin.coinInfo[index].price;
                      double changePercentage = 1;
                      int? amount = coin.coinInfo[index].balance!.toInt();
                      dynamic total = price! * amount!;

                      String tokenAddress =
                          coin.coinInfo[index].tokenAddress ?? '';
                      return TokenBalanceView(
                        amount: amount.toDouble(),
                        imageUrl: imageUrl,
                        name: name,
                        price: price,
                        changePercentage: changePercentage,
                        symbol: symbol,
                        total: total,
                        onTap: () {
                          //print(coin.coinList[index].tokenAddress);
                          Get.to(
                            () => TokenDetail(
                              type: type,
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
                  ),
                ),
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
