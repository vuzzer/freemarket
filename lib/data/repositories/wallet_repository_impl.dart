import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/core/error/wallet/exception_wallet.dart';
import 'package:defi/core/error/wallet/failure_wallet.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/data/datasource/wallet_data_source.dart';
import 'package:defi/data/models/wallet_model.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:defi/domain/repositories/wallet/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletDataSource walletDataSource;
  final NetworkInfo networkInfo;

  WalletRepositoryImpl(
      {required this.walletDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> generateMnemonic() async {
    // TODO: implement generateMnemonic
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Wallet>> initialiseFromMnemonic(
      String mnemonic) async {
    if (await networkInfo.isConnected) {
      try {
        final wallet = await walletDataSource.initialiseFromMnemonic(mnemonic);
        return right(wallet);
      } on MnemonicException {
        return left(MnemonicFailure());
      }
    }
    return left(InternetFailure());
  }
  

  @override
  Future<Either<Failure, Wallet>> initialiseFromPrivateKey(
      String privateKey) async {
    String address = "0xfC6034506eFB052FFd06ED22A9e04e58764D36d5";
    String privateKey =
        "bb70d8b0dd6226e4a1633f0aa3900cdc63e31e30f0cb496d2e0330ae9ac9da50";
    final wallet = WalletModel(
      address: address,
      privateKey: privateKey,
    );

    //Check if device is connected
    networkInfo.isConnected;

    return right(wallet);
  }

  @override
  Future<Either<Failure, Wallet>> createWallet(String mnemonic) async {
    if (await networkInfo.isConnected) {
      final wallet = await walletDataSource.createWallet(mnemonic);
      return right(wallet);
    }
    return left(InternetFailure());
  }
}
