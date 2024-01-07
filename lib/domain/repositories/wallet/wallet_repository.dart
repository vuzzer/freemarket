import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/wallet.dart';

abstract class WalletRepository {
  Future<Either<Failure, String>> generateMnemonic();
  Future<Either<Failure, Wallet>> createWallet(String mnemonic);
  Future<Either<Failure, Wallet>> initialiseFromMnemonic(
      String mnemonic);
  Future<Either<Failure, Wallet>> initialiseFromPrivateKey(String privateKey);
}
