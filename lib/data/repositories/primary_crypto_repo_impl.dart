import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/primary_crypto_data.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/repositories/primary-crypto/primary_crypto_repo.dart';

class PrimaryCryptoRepoImpl implements PrimaryCryptoRepo {
  final PrimaryCryptoData primaryCryptoData;

  PrimaryCryptoRepoImpl(this.primaryCryptoData);

  @override
  Future<Either<Failure, CryptoInfo>> changePrimaryCrypto(CryptoInfo info) {
    // TODO: implement changePrimaryCrypto
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CryptoInfo>> getPrimaryCrypto() async {
    try {
      final crypto = await primaryCryptoData.getPrimaryCrypto();
      return right(crypto);
    } on GetPrimaryException {
      return left(GetPrimaryCryptoFailure());
    }
  }
}
