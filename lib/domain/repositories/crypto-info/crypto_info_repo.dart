import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/crypto.dart';

abstract class CryptoInfoRepo {
  Future<Either<Failure, List<CryptoInfo>>> getCryptoInfo();
}
