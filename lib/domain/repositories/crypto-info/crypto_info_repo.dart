import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';

abstract class CryptoInfoRepo {
  Future<Either<Failure, List<CryptoInfoRepo>>> getCryptoInfo();
}
