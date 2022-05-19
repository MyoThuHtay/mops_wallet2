// ignore_for_file: avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';

class TokenBalanceView extends StatelessWidget {
  const TokenBalanceView(
      {Key? key,
      required this.amount,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.changePercentage,
      required this.symbol,
      required this.total,
      required this.onTap})
      : super(key: key);

  final double amount;
  final String imageUrl;
  final String name;
  final num? price;
  final double? changePercentage;
  final String symbol;
  final double total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            top: Dimensions.height10,
            left: Dimensions.width10,
            right: Dimensions.width10),
        child: Container(
          width: Dimensions.screenWidth,
          height: Dimensions.height20*5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              border: Border.all(width: 1,color: AppColors.mainColor),
              color: AppColors.iconColor0),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.all(Dimensions.height15),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                   imageBuilder: (context, imageProvider) =>
                   Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth
                      ),
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.iconColor0,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[500]!,
                              offset: const Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 1),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1)
                        ],
                      
                    ),
                    height: Dimensions.height30*3+8,
                    width: Dimensions.width30*2+8,
                  ),
                  // placeholder: (context, url) => Container(
                  //   alignment: Alignment.center,
                  //   child: Image.asset('assets/images/banner.png'),
                  // ),
                  errorWidget: (context ,url ,error) => Image.asset('assets/images/banner.png'),
                ),
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
                          Text(
                            '\$ ${price!.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: Dimensions.font14,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Text(
                            changePercentage! < 0
                                ? changePercentage!.toStringAsFixed(2) +
                                '%'
                                : '+' +
                                changePercentage!.toStringAsFixed(2) +
                                '%',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: changePercentage! < 0
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
                  padding:  EdgeInsets.only(right: Dimensions.width10),
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
  }
}
