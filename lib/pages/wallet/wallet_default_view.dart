// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';

import 'token_detail.dart';

class WalletDefaultView extends StatelessWidget {
  const WalletDefaultView(
      {Key? key,
      })
      : super(key: key);

  

  @override
  Widget build(BuildContext context) {

    final double amount =0;
  final String imageUrl ="https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579";
  final String name ="Bitcoin";
  final num? price= 20712;
  final double? changePercentage = -2.09509;
  final String symbol ="btc";
  final double total = 0;
  final tokenAddress = "0xe887232387645c90601935fc028d0589d97942eb";
  

    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
                    //print(coin.coinList[index].tokenAddress);
                    Get.to(
                      () => TokenDetail(
                        amount: amount,
                        imageUrl: imageUrl,
                        name: name,
                        price: price!,
                        changePercentage: changePercentage!,
                        symbol: symbol,
                        total: total,
                        tokenAddress: tokenAddress,
                      ),
                    );
                  },
            child: Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  left: Dimensions.width10,
                  right: Dimensions.width10),
              child: Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height20 * 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    border: Border.all(width: 1, color: AppColors.mainColor),
                    color: AppColors.iconColor0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Dimensions.height15),
                      child: CircleAvatar(child: Image.network(imageUrl)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: Dimensions.width10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: Dimensions.font14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              children: [
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    '\$ ${price!.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: Dimensions.font14,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Text(
                                  changePercentage! < 0
                                      ? changePercentage.toStringAsFixed(2) +
                                          '%'
                                      : '+' +
                                          changePercentage.toStringAsFixed(2) +
                                          '%',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: changePercentage< 0
                                          ? Colors.red
                                          : Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: Dimensions.width10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FittedBox(
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    '${amount.toString()} ',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: Dimensions.font14,
                                    ),
                                  ),
                                  Text(
                                    '${symbol.toUpperCase()} ',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: Dimensions.font14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Text(
                              '\$ ${total.toStringAsFixed(5)}',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: Dimensions.font14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
