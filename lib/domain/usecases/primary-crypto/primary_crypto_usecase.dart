import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/repositories/primary-crypto/primary_crypto_repo.dart';

class PrimaryCryptoUsecase {
  final PrimaryCryptoRepo primaryCryptoRepo;

  const PrimaryCryptoUsecase(this.primaryCryptoRepo);

  Future<Either<Failure, CryptoInfo>> changePrimaryCrypto(CryptoInfo info) {
    return primaryCryptoRepo.changePrimaryCrypto(info);
  }

  Future<Either<Failure, CryptoInfo>> getPrimaryCrypto() {
    return primaryCryptoRepo.getPrimaryCrypto();
  }
}
