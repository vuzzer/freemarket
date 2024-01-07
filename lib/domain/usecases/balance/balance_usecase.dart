import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/balance.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/repositories/balance/balance_repository.dart';

class BalanceUseCase {
  final BalanceRepository balanceRepository;
  BalanceUseCase(this.balanceRepository);

    Future<Either<Failure, Balance>> changeNetwork(NetworkType network) {
    return balanceRepository.changeNetwork(network);
  }

  Future<Either<Failure, String>> getTokenBalance(NetworkType networkType) {
    return balanceRepository.getTokenBalance(networkType);
  }
  
}
