import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';

abstract class WalletSetupRepository {
  void generateMnemonic();
  Future<Either<Failure, bool>> confirmMnemonic(String mnemonic);
  Future<Either<Failure, bool>> importFromMnemonic(String mnemonic);
  Either<Failure, String> mnemonicNormalise(String mnemonic);
  Future<Either<Failure, bool>> importFromPrivateKey(String privateKey);
}
