import 'package:dartz/dartz.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:defi/domain/repositories/wallet/wallet_repository.dart';
import 'package:defi/domain/usecases/wallet/wallet_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'wallet_test.mocks.dart';

@GenerateMocks([WalletRepository])
void main() {
  late WalletUsecase walletUsecase;
  late MockWalletRepository mockWalletRepository;
  late Wallet wallet;
  late String entropyMnemonic, privateKey, mnemonic;

  setUp(() {
    mockWalletRepository = MockWalletRepository();
    walletUsecase = WalletUsecase(mockWalletRepository);
    entropyMnemonic = "Ernest lobby";
    mnemonic = "12words";
    privateKey = "x01hj";
    wallet = const Wallet(
      address: "0x13",
      privateKey: "0x1w",
    );
  });

  test("Should return a new Wallet", () async {
    //arrange
    when(mockWalletRepository.createWallet(any))
        .thenAnswer((_) async => Right(wallet));
    //assert
    final result = await walletUsecase.createWallet(mnemonic);
    //act
    expect(result, Right(wallet));
  });

  test("Should initialize a wallet from Mnemonic", () async {
    when(mockWalletRepository.initialiseFromMnemonic(entropyMnemonic))
        .thenAnswer((_) async => Right(wallet));
    //The act phase of test
    final result = await walletUsecase.initialiseFromMnemonic(entropyMnemonic);
    //Usecases should return a Wallet
    expect(result, Right(wallet));
  });

  test("Should initialize a wallet from PrivateKey", () async {
    when(mockWalletRepository.initialiseFromPrivateKey(privateKey))
        .thenAnswer((_) async => Right(wallet));
    //The act phase of test
    final result = await walletUsecase.initialiseFromPrivateKey(privateKey);
    //Usecases should return a Wallet
    expect(result, Right(wallet));
  });
}
