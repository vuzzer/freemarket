import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/crypto.dart';

abstract class PrimaryCryptoRepo {
  Future<Either<Failure, CryptoInfo>> changePrimaryCrypto(CryptoInfo info);
  Future<Either<Failure, CryptoInfo>> getPrimaryCrypto();
  Future<Either<Failure, bool>> removePrimaryCrypto(CryptoInfo crypto);
}
