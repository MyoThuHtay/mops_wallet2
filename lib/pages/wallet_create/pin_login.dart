import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mops_wallet/model/wallet_model.dart';
//import 'package:mtoken_wallet/utilities/wallet_database.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key, required this.wallet}) : super(key: key);
  final Wallets? wallet;
  @override
  LogInState createState() => LogInState();
}

class LogInState extends State<LogIn> {
  TextEditingController pinText = TextEditingController();
  bool isLogging = false;
  bool isLoading = false;
  final _user = SharedPreferences.getInstance();

  String pin = '';
  String pin2 = '';
  userLogin() async {
    final user = await _user;
    setState(
      () {
        pin = user.getString('pin')!;
        isLogging = user.getBool('isLogging')!;
      },
    );
  }

  @override
  void initState() {
    userLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final wallet = widget.wallet;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                heightFactor: MediaQuery.of(context).size.height / 100,
                child: const Text(
                  'Enter Your Passcode',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.height / 5,
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
                  onChanged: (output) {
                    setState(() {
                      pin2 = pinText.text;
                    });
                    if (pin == pin2) {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => MyHomePage(
                      //       wallet: Wallets(
                      //         phrase: wallet!.phrase.toString(),
                      //         private: wallet.private.toString(),
                      //         btc: wallet.btc.toString(),
                      //         eth: wallet.eth.toString(),
                      //         etc: wallet.etc.toString(),
                      //         vet: wallet.vet.toString(),
                      //         via: wallet.via.toString(),
                      //         go: wallet.go.toString(),
                      //         grs: wallet.grs.toString(),
                      //         ltc: wallet.ltc.toString(),
                      //         dgb: wallet.dgb.toString(),
                      //         poa: wallet.poa.toString(),
                      //         aion: wallet.aion.toString(),
                      //         theta: wallet.theta.toString(),
                      //         tomo: wallet.tomo.toString(),
                      //         tt: wallet.tt.toString(),
                      //         clo: wallet.clo.toString(),
                      //         wan: wallet.wan.toString(),
                      //         xpud: wallet.xpud.toString(),
                      //         wallets: 'My Wallet',
                      //         isCreated: wallet.isCreated,
                      //       ),
                      //     ),
                      //   ),
                      // );
                    }
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
