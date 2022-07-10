// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/pages/wallet_create/recovery_phrase.dart';

class IntroPageTwo extends StatefulWidget {
  const IntroPageTwo({Key? key}) : super(key: key);
  //final String title;

  @override
  IntroPageTwoState createState() => IntroPageTwoState();
}

class IntroPageTwoState extends State<IntroPageTwo> {
  bool newValue = true;
  bool isEnabled = false;
  Color _color = Colors.grey;
  _continue(bool isEnabled) {
    if (isEnabled == true) {
      Get.to( () => const Recovery());
      
    }
  }

  @override
  void dispose() {
    isEnabled = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Center(
                child: Text(
                  "Back Up Your Wallet Now!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: const BoxDecoration(),
                child: const Center(
                  child: Text(
                    "In The Next Step,You Will See 12 Words That Allows You To Recover A Wallet.",
                    //textWidthBasis: TextWidthBasis.parent,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                // width: MediaQuery.of(context).size.width / 2,
                // height: MediaQuery.of(context).size.height / 10,
                child: Image.asset(
                  'assets/images/mops.png',
                  width: 400,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'I understand that if I lose my recovery words,I will not be able to access my wallet.',
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
                checkColor: Colors.white,
                activeColor: Colors.blue,
                value: isEnabled,
                onChanged: (bool? newValue) {
                  if (newValue == true) {
                    setState(
                      () {
                        isEnabled = newValue!;
                        _color = Colors.blue;
                      },
                    );
                  } else {
                    setState(() {
                      isEnabled = false;
                      _color = Colors.grey;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_color),
                  ),
                  onPressed: () {
                    _continue(isEnabled);
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
