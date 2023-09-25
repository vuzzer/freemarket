import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/balance.dart';
import 'package:defi/domain/entities/network_type.dart';

abstract class BalanceRepository {
  Future<Either<Failure, Balance>> changeNetwork(NetworkType network);
  Future<Either<Failure, String>> getTokenBalance(NetworkType networkType);
}
      