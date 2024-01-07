import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/core/error/wallet/failure_wallet.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/data/datasource/wallet_data_source.dart';
import 'package:defi/data/models/wallet_model.dart';
import 'package:defi/data/repositories/wallet_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../fixtures/fixture_reader.dart';
import 'wallet_repository_impl_test.mocks.dart';

@GenerateMocks([WalletDataSource, NetworkInfo])
void main() {
  late WalletRepositoryImpl walletRepositoryImpl;
  late MockNetworkInfo mockNetworkInfo;
  late MockWalletDataSource mockWalletDataSource;

  final Map<String, dynamic> credentials =
      json.decode(fixture("credential.json"));
  final mnemonic = credentials["mnemonic"];
  final Map<String, dynamic> walletData = json.decode(fixture("wallet.json"));
  final walletModel = WalletModel.fromJson(walletData);

  setUp(() {
    mockWalletDataSource = MockWalletDataSource();
    mockNetworkInfo = MockNetworkInfo();
    walletRepositoryImpl = WalletRepositoryImpl(
        walletDataSource: mockWalletDataSource, networkInfo: mockNetworkInfo);
  });

  void runTestsOnline(Function body) {
    group("device is online", () {
      setUp(() =>
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true));
      body();
    });
  }

  void runTestsOffline(Function body) {
    group("device is offline", () {
      setUp(() =>
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false));
      body();
    });
  }

  group("createWallet", () {
    runTestsOnline(() {
      test(
          "Should return a new wallet when the call to wallet data source is successful",
          () async {
        //Arrange
        when(mockWalletDataSource.createWallet(mnemonic))
            .thenAnswer((_) async => walletModel);
        //Assert
        final result = await walletRepositoryImpl.createWallet(mnemonic);
        //Act
        verify(mockNetworkInfo.isConnected);
        verify(mockWalletDataSource.createWallet(mnemonic));
        expect(result, equals(right(walletModel)));
      });
    });

    runTestsOffline(() {
      test("Should throw InternetFailure when device is offline", () async {
        //Arragne
        when(mockWalletDataSource.createWallet(any))
            .thenAnswer((_) async => walletModel);
        //Assert
        final result = await walletRepositoryImpl.createWallet(mnemonic);
        //Act
        verify(mockNetworkInfo.isConnected);
        verifyZeroInteractions(mockWalletDataSource);
        expect(result, equals(left(InternetFailure())));
      });
    });
  });

  group("initializeFromMnemonic", () {
    runTestsOnline(() {
      test(
          "Should return a wallet initialized from mnemonic when the call of wallet data source is successful",
          () async {
        //Arrange
        when(mockWalletDataSource.initialiseFromMnemonic(any))
            .thenAnswer((_) async => walletModel);
        //Assert
        final result =
            await walletRepositoryImpl.initialiseFromMnemonic(mnemonic);
        //Act
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(right(walletModel)));
      });
    });

    runTestsOnline(() {
      test("Should throw error when mnemonic is incorrect", () async {
        //Arrange
        when(mockWalletDataSource.initialiseFromMnemonic(any))
            .thenThrow(MnemonicException());
        //Assert
        final result =
            await walletRepositoryImpl.initialiseFromMnemonic(mnemonic);
        //Act
        expect(result, equals(left(MnemonicFailure())));
      });
    });
  });

  group("initializeFromPrivateKey", () {
    runTestsOnline(() {
      test(
          "Should return a wallet initialized by privatekey when the call to wallet data source is successful",
          () async {
        //Arrange
        when(mockWalletDataSource.initialiseFromPrivateKey(any))
            .thenAnswer((_) async => walletModel);
        //Assert
        final result = await walletRepositoryImpl
            .initialiseFromPrivateKey(walletData["privateKey"]);
        //Act
        verify(mockNetworkInfo.isConnected);
        expect(result, equals(right(walletModel)));
      });
    });
  });
}
