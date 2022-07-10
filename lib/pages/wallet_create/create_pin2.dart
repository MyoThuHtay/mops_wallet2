import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/pages/wallet_create/read_pin.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassCode2 extends StatefulWidget {
  const PassCode2({Key? key, required this.pin}) : super(key: key);
  final String? pin;
  @override
  PassCode2State createState() => PassCode2State();
}

class PassCode2State extends State<PassCode2> {
  final _user = SharedPreferences.getInstance();
  TextEditingController pinText2 = TextEditingController();
  String pin2 = '';
  login(String pin2) async {
    final user = await _user;

    setState(() {
      user.setBool('isLogging', true);
      user.setString('pin', pin2);
    });
    if (kDebugMode) {
      print(pin2);
      print(user.getBool('isLogging'));
      print(user.getString('pin'));
    }
   Get.offAll(()=> const CreatePin());
  }

  @override
  Widget build(BuildContext context) {

    //bool isLogging = false;
    String? pin = widget.pin;

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
                  'Re-Enter Your Passcode',
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
                    controller: pinText2,
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
                    onChanged: (output) {
                      setState(() {
                        pin2 = pinText2.text;
                      });
                    },
                    onCompleted: (output) {
                      if (pin == pin2) {
                        setState(() {
                          pin2 = pinText2.text;
                        });
                        login(pin2);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
