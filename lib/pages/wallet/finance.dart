import 'package:flutter/material.dart';
import 'package:mops_wallet/model/wallet_model.dart';

class Finance extends StatefulWidget {
  const Finance({Key? key, required this.wallet}) : super(key: key);
  final Wallets wallet;
  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Center(
            child: Text(widget.wallet.eth),
          )
        ],
      ),
    );
  }
}
