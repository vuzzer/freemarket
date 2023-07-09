import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/network_type.dart';

abstract class WalletRepository {
  Future<Either<Failure, void>> initialiseFromMnemonic(String entropyMnemonic);
  Future<Either<Failure, void>> initialiseFromPrivateKey(String privateKey);
  Future<Either<Failure, void>> changeNetwork(NetworkType network);
}
