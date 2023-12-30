import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/repositories/transfer/wallet_transfer.dart';

class WalletTransfer {
  final WalletTransfertRepository walletTransfertRepository;
  WalletTransfer(this.walletTransfertRepository);

  Future<Either<Failure, bool>> transfer(
      NetworkType network, String to, String amount) {
    return walletTransfertRepository.transfer(network, to, amount);
  }

  Future<Either<Failure, String>> transferLog(String id) {
    return walletTransfertRepository.transferLog(id);
  }
}