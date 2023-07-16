import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/repositories/setup/wallet_setup.dart';

class WalletSetup {
  final WalletSetupRepository walletSetupRepository;
  WalletSetup(this.walletSetupRepository);

  Future<Either<Failure, bool>> confirmMnemonic(String mnemonic) {
    return walletSetupRepository.confirmMnemonic(mnemonic);
  }

  Future<Either<Failure, bool>> importFromMnemonic(String mnemonic) {
    return walletSetupRepository.importFromMnemonic(mnemonic);
  }

  Either<Failure, String> mnemonicNormalise(String mnemonic) {
    return walletSetupRepository.mnemonicNormalise(mnemonic);
  }

  Future<Either<Failure, bool>> importFromPrivateKey(String privateKey) {
    return walletSetupRepository.importFromPrivateKey(privateKey);
  }
}
