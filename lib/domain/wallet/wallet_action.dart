import 'package:defi/domain/entities/network_type.dart';

abstract class WalletAction {}

class WalletInit extends WalletAction {}

class InitialiseWallet extends WalletAction {
  InitialiseWallet(this.network, this.address, this.privateKey);
  final NetworkType network;
  final String address;
  final String privateKey;
}

class NetworkChanged extends WalletAction {
  NetworkChanged(this.network);
  final NetworkType network;
}

class BalanceUpdated extends WalletAction {
  BalanceUpdated(this.ethBalance, this.tokenBalance);
  final BigInt ethBalance;
  final BigInt tokenBalance;
}

class UpdatingBalance extends WalletAction {}