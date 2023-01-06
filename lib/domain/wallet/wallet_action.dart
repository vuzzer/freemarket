import 'package:defi/domain/entities/network_type.dart';

abstract class WalletAction {}

class WalletInit extends WalletAction {}

class InitialiseWallet extends WalletAction {
  InitialiseWallet( this.address, this.privateKey);
  final String address;
  final String privateKey;
}

class NetworkChanged extends WalletAction {
  NetworkChanged(this.network);
  final NetworkType network;
}

class BalanceUpdated extends WalletAction {
  BalanceUpdated(this.network, this.ethBalance, this.tokenBalance);
  final NetworkType network;
  final BigInt ethBalance;
  final BigInt tokenBalance;
}

class UpdatingBalance extends WalletAction {
  UpdatingBalance(this.network);
  final NetworkType network;
}
