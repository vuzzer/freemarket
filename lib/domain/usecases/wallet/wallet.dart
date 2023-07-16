import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/repositories/wallet/wallet.dart';

class Wallet {
  final WalletRepository walletRepository;
  Wallet(this.walletRepository);

  Future<Either<Failure, void>> initialiseFromMnemonic(String entropyMnemonic) {
    return walletRepository.initialiseFromMnemonic(entropyMnemonic);
  }

  Future<Either<Failure, void>> initialiseFromPrivateKey(String privateKey) {
    return walletRepository.initialiseFromPrivateKey(privateKey);
  }

  Future<Either<Failure, void>> changeNetwork(NetworkType network) {
    return walletRepository.changeNetwork(network);
  }

  Future<Either<Failure, String>> getTokenBalance(NetworkType networkType) {
    return walletRepository.getTokenBalance(networkType);
  }
}
