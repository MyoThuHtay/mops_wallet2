import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/foundation.dart';
import 'package:coinslib/coinslib.dart';
import 'package:eip55/eip55.dart';

class WalletAddressService extends GetxService{
 
  
 

  
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    
    return privateKey;
  }

  Future<String> getXprvKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final node = bip32.BIP32.fromSeed(seed);
    final xPrv = node.derivePath("m/44'/60'/0'/0").toBase58();
    
    return xPrv;
  }

  
  Future<String> getbtcAddress(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final node = root.derivePath("m/84'/0'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: node.publicKey)).data.address;
    

    return address!;
  }

  
  Future<List<String>> getethAddress(String mnemonic) async {
    final List<String> addresses = [];
    final path = [
      "m/44'/60'/0'/0/0", //eth,bsc,matic
      "m/44'/61'/0'/0/0", //etc
      "m/44'/178'/0'/0/0", //poa
      "m/44'/425'/0'/0/0", //aion
      "m/44'/500'/0'/0/0", //theta
      "m/44'/818'/0'/0/0", //vet
      "m/44'/820'/0'/0/0", //callisto(clo)
      "m/44'/889'/0'/0/0", //tomo
      "m/44'/1001'/0'/0/0", //thunder token
      "m/44'/6060'/0'/0/0", //gochain
      "m/44'/5718350'/0'/0/0" //wanchain
    ];

    final valid = bip39.validateMnemonic(mnemonic);
    if (valid == true) {
      final seed = bip39.mnemonicToSeedHex(mnemonic);
      Chain chain = Chain.seed(seed);
      for (int i = 0; i < path.length; i++) {
        ExtendedKey key = chain.forPath(path[i]);
        EthPrivateKey privateKey = EthPrivateKey.fromHex(key.privateKeyHex());
        EthereumAddress address = await privateKey.extractAddress();
        final eipAddress = toEIP55Address(address.toString());
        addresses.add(eipAddress);
        
      }
      return addresses;
    } else {
      throw Exception('No Valid mnemonic');
    }
  }

  
  Future<String> getltcAddress(String mnemonic) async {
    NetworkType litecoin = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'ltc',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/2'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: litecoin)
            .data
            .address;
    final ltc = address!;
    

    return ltc;
  }

  
  Future<String> getviaAddress(String mnemonic) async {
    NetworkType viacoin = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'viacoin',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/14'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: viacoin)
            .data
            .address;
    final via = address!;
    

    return via;
  }

  
  Future<String> getgrsAddress(String mnemonic) async {
    NetworkType groestlcoin = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'grs',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/17'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: groestlcoin)
            .data
            .address;
    final grs = address!;
   

    return grs;
  }

  
  Future<String> getbchAddress(String mnemonic) async {
    NetworkType bitcoincash = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'bch',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/2'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: bitcoincash)
            .data
            .address;
    final bch = address!;
    

    return bch;
  }

  
  Future<String> getatomAddress(String mnemonic) async {
    NetworkType atom = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'cosmos',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/118'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: atom)
            .data
            .address;
    final cosmos = address!;
    if (kDebugMode) {
      print('cosmos: ${cosmos.toString()}');
    }

    return cosmos;
  }

  
  Future<String> getxrpAddress(String mnemonic) async {
    // NetworkType bitcoincash = NetworkType(
    //     messagePrefix: '\x19Litecoin Signed Message:\n',
    //     bech32: 'xrp',
    //     bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
    //     pubKeyHash: 0x30,
    //     scriptHash: 0x32,
    //     wif: 0xb0,
    //     opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/44'/144'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey)).data.address;

    final xrp = address!;
    

    return xrp;
  }

  
  Future<String> getbnbAddress(String mnemonic) async {
    NetworkType binancecoin = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'bnb',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/44'/714'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: binancecoin)
            .data
            .address;
    final bnb = address!;
    

    return bnb;
  }

  
  Future<String> getdotAddress(String mnemonic) async {
    NetworkType bitcoincash = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'dot',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/2'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: bitcoincash)
            .data
            .address;
    final dot = address!;
    

    return dot;
  }

  
  Future<String> getxtzAddress(String mnemonic) async {
    NetworkType tezos = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'tz',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/2'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: tezos)
            .data
            .address;
    final xtz = address!;
    

    return xtz;
  }

  
  Future<String> getxlmAddress(String mnemonic) async {
    NetworkType bitcoincash = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'bch',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/2'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: bitcoincash)
            .data
            .address;
    final bch = address!;
    

    return bch;
  }

  
  Future<String> gettrxAddress(String mnemonic) async {
    NetworkType tron = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        //bech32: 'trx',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/44'/195'/0'/0/0");
    final address =
        P2PKH(data: PaymentData(pubkey: key.publicKey), network: tron)
            .data
            .address;
    final trx = address!;
    

    return trx;
  }

  
  Future<String> getzecAddress(String mnemonic) async {
    // NetworkType bitcoincash = NetworkType(
    //     messagePrefix: '\x19Litecoin Signed Message:\n',
    //     bech32: 'zec',
    //     bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
    //     pubKeyHash: 0x30,
    //     scriptHash: 0x32,
    //     wif: 0xb0,
    //     opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/44'/133'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey)).data.address;
    final zec = address!;
    

    return zec;
  }

  
  Future<String> getfilAddress(String mnemonic) async {
    NetworkType bitcoincash = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'fil',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/2'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: bitcoincash)
            .data
            .address;
    final fil = address!;
    

    return fil;
  }

  
  Future<String> getdgbAddress(String mnemonic) async {
    NetworkType digibyte = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'dgb',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/84'/20'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: digibyte)
            .data
            .address;
    final dgb = address!;
    

    return dgb;
  }

  
  Future<String> getthorAddress(String mnemonic) async {
    NetworkType thorchain = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'thor',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: thorchain)
            .data
            .address;
    final thor =
        P2PKH(data: PaymentData(pubkey: key.publicKey), network: thorchain)
            .data
            .address;
    if (kDebugMode) {
      print('thor: ${thor.toString()}');
      print('thor2: ${address.toString()}');
    }

    return thor!;
  }

  
  Future<String> getnanoAddress(String mnemonic) async {
    NetworkType nanocoin = NetworkType(
        messagePrefix: '\x19Litecoin Signed Message:\n',
        bech32: 'nano_',
        bip32: Bip32Type(public: 0x019da462, private: 0x019d9cfe),
        pubKeyHash: 0x30,
        scriptHash: 0x32,
        wif: 0xb0,
        opreturnSize: 80);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final root = bip32.BIP32.fromSeed(seed);

    final key = root.derivePath("m/44'/165'/0'/0/0");
    final address =
        P2WPKH(data: PaymentData(pubkey: key.publicKey), network: nanocoin)
            .data
            .address;
    final nano = address!;
    

    return nano;
  }
}
