import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/crypto_info_source.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/repositories/crypto-info/crypto_info_repo.dart';

class CryptoInfoRepoImpl implements CryptoInfoRepo {
  final CryptoInfoSource cryptoInfoSource;

  CryptoInfoRepoImpl(this.cryptoInfoSource);

  @override
  Future<Either<Failure, List<CryptoInfo>>> getCryptoInfo() async {
    try {
      final cryptos = await cryptoInfoSource.getCryptoInfo();
      return Right(cryptos);
    } on NetworkException {
      return Left(InternetFailure());
    }
  }
}
