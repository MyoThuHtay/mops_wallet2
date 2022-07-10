import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration:
            BoxDecoration(color: const Color(0x12121212).withOpacity(0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/loading.gif",
              width: 300,
              height: 300,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const SizedBox(
              height: 20,
            ),
            const Text('Loading....Wallet')
          ],
        ),
      ),
    );
  }
}
