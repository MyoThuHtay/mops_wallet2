// ignore_for_file: avoid_print

import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';
import 'package:coinslib/coinslib.dart';
import 'package:eip55/eip55.dart';

abstract class WalletService {
  Future<String> getPrivateKey(String mnemonic);
  Future<String> getXprvKey(String mnemonic);
  Future<List<String>> getethAddress(String mnemonic);
  Future<List<String>> getAddress(String mnemonic);
}

class WalletAddressService implements WalletService {
  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    return privateKey;
  }

  @override
  Future<String> getXprvKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final node = bip32.BIP32.fromSeed(seed);
    final xPrv = node.derivePath("m/44'/60'/0'/0").toBase58();

    return xPrv;
  }

  // Future<String> getbtcAddress(String mnemonic) async {
  //   final valid = bip39.validateMnemonic(mnemonic);
  //   if (valid != true) throw Exception('No Valid mnemonic');
  //   final seed = bip39.mnemonicToSeed(mnemonic);
  //   final root = bip32.BIP32.fromSeed(seed);

  //   final node = root.derivePath("m/84'/0'/0'/0/0");
  //   final address =
  //       P2WPKH(data: PaymentData(pubkey: node.publicKey)).data.address;

  //   return address!;
  // }
  @override
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
    if (valid != true) throw Exception('No Valid mnemonic');
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
  }

  List bech32 = [
    'bc',
    'ltc',
    'via',
    'grs',
    'dgb',
  ];
  var derivePath = [
    "m/84'/0'/0'/0/0",
    "m/84'/2'/0'/0/0",
    //"m/84'/3'/0'/0/0",
    "m/84'/14'/0'/0/0",
    "m/84'/17'/0'/0/0",
    // "m/84'/118'/0'/0/0",
    // "m/44'/144'/0'/0/0",
    // "m/44'/714'/0'/0/0",
    // "m/44'/195'/0'/0/0",
    // "m/44'/133'/0'/0/0",
    "m/84'/20'/0'/0/0",
    // "m/0/0",
    // "m/44'/165'/0'/0/0"
  ];
  List<String> messagePrefix = [
    'Bitcoin Signed Message:\n',
    'Litecoin Signed Message:\n',
    'Dogecoin Signed Message:\n',
  ];
  List bip32List = [
    Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
    Bip32Type(public: 0x019da462, private: 0x019d9cfe),
  ];
  List pubKeyHash = [
    0x00,
    0x30,
  ];
  List scriptHash = [
    0x05,
    0x32,
  ];
  List wif = [
    0x80,
    0xb0,
  ];
  List opreturnSize = [
    80,
    80,
  ];

  List<String> addressList = [];
  @override
  Future<List<String>> getAddress(String mnemonic) async {
    final valid = bip39.validateMnemonic(mnemonic);
    if (valid != true) throw Exception('No Valid mnemonic');
    for (int i = 0; i < derivePath.length; i++) {
      NetworkType network = NetworkType(
          messagePrefix: 'BitCoin Signed Message:\n',
          bech32: bech32[i],
          bip32: Bip32Type(public: 0x0488b21e, private: 0x0488ade4),
          pubKeyHash: 0x00,
          scriptHash: 0x05,
          wif: 0x80,
          opreturnSize: 80);
      final seed = bip39.mnemonicToSeed(mnemonic);
      final root = bip32.BIP32.fromSeed(seed);

      final key = root.derivePath(derivePath[i]);
      
      final address =
          P2WPKH(data: PaymentData(pubkey: key.publicKey), network: network)
              .data
              .address;
      addressList.add(address!);
      
    }
    return addressList;
  }
}
