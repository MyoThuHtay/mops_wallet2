import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/controllers/wallet_create_controller.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/pages/home.dart';
import 'package:mops_wallet/pages/wallet_create/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComfirmMnemonic extends StatefulWidget {
  const ComfirmMnemonic({Key? key, required this.mne, required this.name})
      : super(key: key);

  final String mne;
  final String name;

  @override
  ComfirmMnemonicState createState() => ComfirmMnemonicState();
}

class ComfirmMnemonicState extends State<ComfirmMnemonic> {
  bool isLoading = true;
  TextEditingController editor = TextEditingController();
  late Wallets wallet;
  Future createWallet(String mne) async {
    final walletid = await SharedPreferences.getInstance();
    String wName = widget.name;
    String mnemonic = widget.mne;
    // late Wallets wallet;
    if (mne == mnemonic) {
      wallet = await WalletCreateController.createWallet(wName, mnemonic);
      setState(() {
        walletid.setInt('WalletId', wallet.id!);
      });
    }
    return wallet;
  }

  @override
  void dispose() {
    super.dispose();
    editor.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletCreateController>(builder: (service) {
      return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      const Text(
                        'Verify Recovery Phrase',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 50.0, right: 50.0),
                        child: Text(
                          'Write Or Paste the Recovery Phrase.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, top: 30, right: 50),
                            child: TextField(
                              controller: editor,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              minLines: 4,
                              maxLines: 5,
                              textAlignVertical: TextAlignVertical.center,
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).scaffoldBackgroundColor),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = false;
                          });
                          await createWallet(editor.text);

                          Get.offAll(
                            () => MyHomePage(wallet: wallet),
                          );

                          Get.find<WalletController>()
                              .getBscTokenList(wallet.eth);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 15,
                          child: const Center(
                            child: Text('Done'),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Loading());
    });
  }
}
