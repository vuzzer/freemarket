import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/repositories/crypto-info/crypto_info_repo.dart';

class CryptoInfoUseCase {
  final CryptoInfoRepo cryptoInfoRepo;

  CryptoInfoUseCase(this.cryptoInfoRepo);

  Future<Either<Failure, List<CryptoInfoRepo>>> getCryptoInfo() {
    return cryptoInfoRepo.getCryptoInfo();
  } 
}
