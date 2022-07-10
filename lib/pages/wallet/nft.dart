import 'package:flutter/material.dart';
import 'package:mops_wallet/model/wallet_model.dart';

class NFT extends StatefulWidget {
  const NFT({Key? key,required this.wallet}) : super(key: key);
  final Wallets wallet;

  @override
  State<NFT> createState() => _NFTState();
}

class _NFTState extends State<NFT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children:  [
          Center(
            child: Text(widget.wallet.eth),
          )
        ],
      ),
    );
  }
}
