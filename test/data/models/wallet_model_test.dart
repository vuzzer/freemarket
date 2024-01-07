import 'dart:convert';

import 'package:defi/data/models/wallet_model.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const wallet = WalletModel(
      address: "0x23", privateKey: "x0we");

  test("Should be a subclass of Wallet entity", () async {
    //assert
    expect(wallet, isA<Wallet>());
  });

  group("fromJson", () {
    test("Should return a valid model", () async {
      //arrange
      final Map<String, dynamic> data = json.decode(fixture("wallet.json"));
      //assert
      final result = WalletModel.fromJson(data);
      //act
      expect(result, wallet);
    });
  });

  group("toJson", () {
    test("Should return a dictonnary", () async {
      //Arrange
      final Map<String, dynamic> walletJson =
          json.decode(fixture("wallet.json"));
      //Assert
      final result = wallet.toJson();
      //Act
      expect(result, walletJson);
    });
  });
}
