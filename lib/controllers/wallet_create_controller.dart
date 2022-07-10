import 'package:get/get.dart';
import 'package:mops_wallet/model/wallet_model.dart';
import 'package:mops_wallet/repository/wallet_database_repo.dart';
import 'package:mops_wallet/utils/wallet_creation.dart';
import 'package:bip39/bip39.dart' as bip39;

class WalletCreateController extends GetxController {
  final service = Get.find<WalletAddressService>();
  int? id;
  bool _isCreated = false;
  bool get isCreated => _isCreated;
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
  late Wallets _createWallet;
  Wallets get createwallet => _createWallet;
  late Wallets _wallet;
  Wallets get wallet => _wallet;
  late int lastId;

  String generateMnemonic() {
    var mnemonic = bip39.generateMnemonic();
    return mnemonic;
  }

  Future<Wallets> getWallet(int id) async {
    _wallet = await WalletDatabase.instance.readWallet(id);
    return _wallet;
  }

  Future getWalletId() async {
    final wallets = await WalletDatabase.instance.readAllWallets();
    if (wallets.isNotEmpty) {
      lastId = wallets.last.id ?? 1;
    } else {
      lastId = 0;
    }
    return lastId;
  }

  Future<Wallets> createWallet(name, mnemonic) async {
    await getWalletId();
    id = lastId + 1;
    private = await service.getPrivateKey(mnemonic);
    xpud = await service.getXprvKey(mnemonic);
    btc = await service.getbtcAddress(mnemonic);
    addresses = await service.getethAddress(mnemonic);
    ltc = await service.getltcAddress(mnemonic);
    via = await service.getviaAddress(mnemonic);
    grs = await service.getgrsAddress(mnemonic);
    bch = await service.getbchAddress(mnemonic);
    atom = await service.getatomAddress(mnemonic);
    xrp = await service.getxrpAddress(mnemonic);
    bnb = await service.getbnbAddress(mnemonic);
    dot = await service.getdotAddress(mnemonic);
    xtz = await service.getxtzAddress(mnemonic);
    xlm = await service.getxlmAddress(mnemonic);
    trx = await service.gettrxAddress(mnemonic);
    zec = await service.getzecAddress(mnemonic);
    fil = await service.getfilAddress(mnemonic);
    dgb = await service.getdgbAddress(mnemonic);
    thor = await service.getthorAddress(mnemonic);
    nano = await service.getnanoAddress(mnemonic);
    _isCreated = true;
    _createWallet = Wallets(
      id: id,
      phrase: mnemonic.toString(),
      private: private.toString(),
      btc: btc.toString(),
      eth: addresses[0].toString(),
      etc: addresses[1].toString(),
      vet: addresses[5].toString(),
      via: via.toString(),
      go: addresses[9].toString(),
      grs: grs.toString(),
      ltc: ltc.toString(),
      dgb: dgb.toString(),
      poa: addresses[2].toString(),
      aion: addresses[3].toString(),
      theta: addresses[4].toString(),
      tomo: addresses[7].toString(),
      tt: addresses[8].toString(),
      clo: addresses[6].toString(),
      wan: addresses[10].toString(),
      xpud: xpud.toString(),
      wallets: name,
      isCreated: _isCreated,
    );
    await WalletDatabase.instance.create(_createWallet);
    return _createWallet;
  }
}
