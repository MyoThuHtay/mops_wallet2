import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/controllers/wallet_controller.dart';
import 'package:mops_wallet/controllers/wallet_create_controller.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/pages/home.dart';
import 'package:mops_wallet/pages/wallet_create/loading.dart';
import 'package:mops_wallet/utils/colors.dart';
import 'package:mops_wallet/utils/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImportWallet extends StatefulWidget {
  const ImportWallet({Key? key}) : super(key: key);

  @override
  ImportWalletState createState() => ImportWalletState();
}

TextEditingController editor = TextEditingController();

class ImportWalletState extends State<ImportWallet> {
  final snackBar = SnackBar(
    content: const Text('Wallet Already Exit'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {},
    ),
  );
  final snackBar1 = SnackBar(
    content: SizedBox(
      width: Dimensions.screenWidth / 3,
      height: Dimensions.screenHeight / 3,
      child: Card(
        color: AppColors.mainBlackColor.withOpacity(0.5),
        child: Column(children: const [
          CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
          Text('Loading...'),
        ]),
      ),
    ),
    behavior: SnackBarBehavior.floating,
  );

  @override
  void dispose() {
    super.dispose();
    editor.text = '';
  }

  late Wallets wallet;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => WalletController(walletRepo: Get.find(),apiClient: Get.find()));

    return GetBuilder<WalletCreateController>(builder: (service) {
      createWallet(String mne) async {
        const name = 'Multi-Coin Wallet';
        final mnemonic = editor.text;
        final walletid = await SharedPreferences.getInstance();
        wallet = await service.createWallet(name, mnemonic);
        walletid.setInt('WalletId', service.createwallet.id!);
      }

      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: isLoading
            ? Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
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
                        width: MediaQuery.of(context).size.width,
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
                          child: Text('Import'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const Loading(),
      );
    });
  }
}
