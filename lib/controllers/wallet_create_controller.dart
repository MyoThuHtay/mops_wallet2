import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/repository/wallet_database_repo.dart';
import 'package:mops_wallet/utils/wallet_creation.dart';
import 'package:bip39/bip39.dart' as bip39;

class WalletCreateController extends GetxController {
  late String private,
      btc,
      eth,
      etc,
      ltc,
      via,
      vet,
      go,
      grs,
      dgb,
      poa,
      aion,
      theta,
      tomo,
      tt,
      clo,
      wan,
      bch,
      atom,
      xrp,
      bnb,
      dot,
      xtz,
      xlm,
      trx,
      zec,
      fil,
      thor,
      nano,
      mnemonic,
      xpud;
  late List<String> addresses = [];
  late List<String> addresses2 = [];
  late Wallets _createWallet;
  Wallets get createwallet => _createWallet;
  late Wallets _wallet;
  Wallets get wallet => _wallet;
  late int lastId;

  int? get id => lastId;

  String generateMnemonic() {
    var mnemonic = bip39.generateMnemonic();
    return mnemonic;
  }

  Future<Wallets> getWallet(int id) async {
    _wallet = await WalletDatabase.instance.readWallet(id);
    return _wallet;
  }

  static Future getWalletId() async {
    final int lastId;
    final wallets = await WalletDatabase.instance.readAllWallets();
    if (wallets.isNotEmpty) {
      lastId = wallets.last.id ?? 1;
    } else {
      lastId = 1;
    }
    return lastId;
  }

  static Future<Wallets> createWallet(String name, String mnemonic) async {
    WalletCreateController controller = WalletCreateController();
    controller.lastId = await getWalletId();
    final id = controller.lastId + 1;
    final service = Get.find<WalletAddressService>();
    final private = await compute(service.getPrivateKey,mnemonic);
    final xpud = await compute(service.getXprvKey,mnemonic);
    final addresses = await compute(service.getethAddress,mnemonic);
    final addresses2 = await compute(service.getAddress,mnemonic);
    const isCreated = true;
    final createWallet = Wallets(
      id: id,
      phrase: mnemonic.toString(),
      private: private.toString(),
      eth: addresses[0].toString(),
      etc: addresses[1].toString(),
      poa: addresses[2].toString(),
      aion: addresses[3].toString(),
      theta: addresses[4].toString(),
      vet: addresses[5].toString(),
      clo: addresses[6].toString(),
      tomo: addresses[7].toString(),
      tt: addresses[8].toString(),
      go: addresses[9].toString(),
      wan: addresses[10].toString(),
      btc: addresses2[0].toString(),
      ltc: addresses2[1].toString(),
      via: addresses2[2].toString(),
      grs: addresses2[3].toString(),
      dgb: addresses2[4].toString(),
      xpud: xpud.toString(),
      wallets: name,
      isCreated: isCreated,
    );
    await WalletDatabase.instance.create(createWallet);
    return createWallet;
  }
}

class WalletCreate {
  final String mnemonic;
  SendPort sendPort;
  String? name;

  String? mne;

  WalletCreate(this.mnemonic, this.sendPort, [this.name, this.mne]);
}
