import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            SvgPicture.asset(
                'assets/images/loadingText.svg',
                color: Colors.white,
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
