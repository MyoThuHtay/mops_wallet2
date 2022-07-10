import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'create_pin2.dart';

class PassCode extends StatefulWidget {
  const PassCode({Key? key}) : super(key: key);
  @override
  PassCodeState createState() => PassCodeState();
}

class PassCodeState extends State<PassCode> {
  TextEditingController pinText = TextEditingController();

  String? pin = '';
  toPage2(String? pin) {
    if (pin != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PassCode2(
            pin: pin,
          ),
        ),
      );
      if (kDebugMode) {
        print(pin);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'Security',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                heightFactor: MediaQuery.of(context).size.height / 200,
                child: const Text(
                  'Enter Your Passcode',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.height / 15,
                child: PinCodeTextField(
                  appContext: context,
                  obscuringCharacter: '*',
                  length: 6,
                  controller: pinText,
                  obscureText: true,
                  autoFocus: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  autoDisposeControllers: false,
                  pinTheme: PinTheme(
                    selectedFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 0,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  onCompleted: (output) {
                    setState(
                      () {
                        pin = pinText.text;
                      },
                    );
                    toPage2(pin);
                  }, onChanged: (String value) {
                    setState(() {
                      pin = pinText.text;
                    });
                },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

