import 'package:defi/core/error/exception.dart';
import 'package:defi/data/models/wallet_model.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';

abstract class WalletDataSource {
  ///No errors is throws
  Future<String> generateMnemonic();

  ///Throws an [CreateWalletException] for all errors
  Future<WalletModel> createWallet(String mnemonic);

  ///Throws an [MnemonicException] for all errors
  Future<WalletModel> initialiseFromMnemonic(String mnemonic);

  ///Throws an [PrivateKeyException] for all errors
  Future<WalletModel> initialiseFromPrivateKey(String privateKey);
}

class WalletDataSourceImpl implements WalletDataSource {
  @override
  Future<String> generateMnemonic() async {
    return bip39.generateMnemonic();
  }

  @override
  Future<WalletModel> createWallet(String mnemonic) async {
    //Generate Mnemonic
    final privateKey = await _getPrivateKey(mnemonic);
    final ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    //Format ETH address
    var ethAddress = ethPrivateKey.address.toString();
    //ethAddress = EthAddressFormatter(ethAddress).mask();

    return WalletModel(
      address: ethAddress,
      privateKey: privateKey,
    );
  }

  @override
  Future<WalletModel> initialiseFromMnemonic(String mnemonic) async {
    // TODO: implement checking of address generated by mnemonic of address stored in firestore.
    final privateKey = await _getPrivateKey(mnemonic);
    final ethPrivateKey = EthPrivateKey.fromHex(privateKey);

    var ethAddress = ethPrivateKey.address.toString();

    return WalletModel(
      address: ethAddress,
      privateKey: privateKey,
    );

    //throw MnemonicException();
  }

  @override
  Future<WalletModel> initialiseFromPrivateKey(String privateKey) {
    // TODO: implement initialiseFromMnemonic
    throw UnimplementedError();
  }

  Future<String> _getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeedHex(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(HEX.decode(seed),
        masterSecret: "M@st2rB1tc01n");
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }
}
