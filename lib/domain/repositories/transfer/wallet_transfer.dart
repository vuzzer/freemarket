import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/network_type.dart';

abstract class WalletTransfertRepository {
  Future<Either<Failure, bool>> transfer(
      NetworkType network, String to, String amount);
  Future<Either<Failure, String>> transferLog(String id);
}
