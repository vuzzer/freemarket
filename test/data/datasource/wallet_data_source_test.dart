import 'dart:convert';

import 'package:defi/data/datasource/wallet_data_source.dart';
import 'package:defi/data/models/wallet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bip39/bip39.dart' as bip39;
import '../../fixtures/fixture_reader.dart';

void main() {
  late WalletDataSourceImpl walletDataSourceImpl;
  final Map<String, dynamic> credentials =
      json.decode(fixture("credential.json"));
  final Map<String, dynamic> walletData = json.decode(fixture("wallet.json"));
  late final String mnemonic, seed;
  late WalletModel wallet;
  setUp(() {
    walletDataSourceImpl = WalletDataSourceImpl();
    mnemonic = credentials["mnemonic"];
    seed = credentials["seed"];
    wallet = WalletModel.fromJson(walletData);
  });

  group("createWallet", () {
    //Bip39 package handle only english words
    test("Should return a seed ca from mnemonic", () async {
      //Assert
      final result = bip39.mnemonicToSeedHex(mnemonic);
      //Actf
      expect(result, seed);
    });

    test("Should return a wallet from mnemonic", () async {
      //Assert
      final result = await walletDataSourceImpl.createWallet(mnemonic);
      //Act
      expect(result, wallet);
    });
  });

  group("initializeFromMnemonic", () {
    test("Should return a wallet", () async {
      //Assert
      final result = await walletDataSourceImpl.createWallet(mnemonic);
      //Act
      expect(result, wallet);
    });
  });
}
