import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:defi/domain/repositories/wallet/wallet_repository.dart';

class WalletUsecase {
  final WalletRepository walletRepository;
  WalletUsecase(this.walletRepository);

  Future<Either<Failure, Wallet>> createWallet(String mnemonic) {
    return walletRepository.createWallet(mnemonic);
  }

  Future<Either<Failure, Wallet>> initialiseFromMnemonic(
      String entropyMnemonic) {
    return walletRepository.initialiseFromMnemonic(entropyMnemonic);
  }

  Future<Either<Failure, Wallet>> initialiseFromPrivateKey(String privateKey) {
    return walletRepository.initialiseFromPrivateKey(privateKey);
  }
}
