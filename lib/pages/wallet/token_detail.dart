// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:mops_wallet/utils/text_and_icon.dart';

class TokenDetail extends StatefulWidget {
  final String type;
  final dynamic amount;
  final String? imageUrl;
  final String name;
  final dynamic price;
  final double changePercentage;
  final String symbol;
  final dynamic total;
  final String tokenAddress;

  const TokenDetail(
      {Key? key,
      required this.type,
      required this.amount,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.changePercentage,
      required this.symbol,
      required this.total,
      required this.tokenAddress})
      : super(key: key);

  @override
  State<TokenDetail> createState() => _TokenDetailState();
}

class _TokenDetailState extends State<TokenDetail> {
  //double amount = widget.amount;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (coin) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: Dimensions.iconSize24,
            ),
          ),
          centerTitle: true,
          title: Text(widget.name),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Text('BUY'),
              iconSize: Dimensions.iconSize24,
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.chartLine),
              iconSize: Dimensions.iconSize24,
            )
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: GetBuilder<WalletController>(
          builder: (controller) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return ListTile(
                    //elevation: 0,
                    tileColor: Theme.of(context).primaryColor,
                    title: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 5,
                                child: Text(
                                  widget.type,
                                  style:
                                      TextStyle(color: AppColors.tittleColor),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  '\$ ${widget.price.toStringAsFixed(10)}',
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.changePercentage < 0
                                    ? '${widget.changePercentage.toStringAsFixed(2)}%'
                                    : '+${widget.changePercentage.toStringAsFixed(2)}%',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: widget.changePercentage < 0
                                        ? Colors.red
                                        : Colors.green),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: CachedNetworkImage(
                            imageUrl: widget.imageUrl!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.fitWidth),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
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
                              height: Dimensions.height30 * 2 + 10,
                              width: Dimensions.width30 * 2 + 10,
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/images/banner.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            '${widget.amount} ${widget.symbol.length > 15 ? ' ${widget.symbol.substring(0, 15)..toUpperCase()}... ' : widget.symbol.toUpperCase()}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            '= \$ ${widget.total.toStringAsFixed(2)} ',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              widget.tokenAddress,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextIcon(
                                onTap: () {},
                                icon: CupertinoIcons.arrow_up_to_line,
                                text: 'Send',
                                textColor: AppColors.tittleColor,
                                iconColor: AppColors.iconColor0,
                                iconSize: Dimensions.iconSize24),
                            SizedBox(
                              width: Dimensions.width45,
                            ),
                            TextIcon(
                                onTap: () {},
                                icon: CupertinoIcons.arrow_down_to_line,
                                text: 'Receive',
                                textColor: AppColors.tittleColor,
                                iconColor: AppColors.iconColor0,
                                iconSize: Dimensions.iconSize24),
                            SizedBox(
                              width: Dimensions.width45,
                            ),
                            TextIcon(
                              onTap: () {},
                              icon: CupertinoIcons.doc_on_doc,
                              text: 'Copy',
                              iconColor: AppColors.iconColor0,
                              textColor: AppColors.tittleColor,
                              iconSize: Dimensions.iconSize24,
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                      ],
                    ),
                  );
                }
                index -= 1;
                return Column(
                  children: [
                    const Divider(
                      thickness: .5,
                      height: .5,
                      color: Colors.black38,
                    ),
                    ListTile(
                      tileColor: Theme.of(context).primaryColor,
                      leading: Icon(
                        CupertinoIcons.arrow_down_to_line,
                        size: Dimensions.iconSize45,
                      ),
                      title: const Text('Transfer'),
                      subtitle: const Text('From: '),
                      trailing: Text(
                          '${widget.amount} ${widget.symbol.length > 15 ? ' ${widget.symbol.substring(0, 5)..toUpperCase()}... ' : widget.symbol.toUpperCase()}'),
                    ),
                    // const Divider(
                    //   thickness: .5,
                    //   height: .5,
                    //   color: Colors.black38,
                    // ),
                  ],
                );
              },
              itemCount: 20,
            );
          },
        ),
      );
    });
  }
}
