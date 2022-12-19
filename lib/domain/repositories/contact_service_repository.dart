import 'dart:async';
import 'package:web3dart/web3dart.dart';

typedef TransferEvent = void Function(
  EthereumAddress from,
  EthereumAddress to,
  BigInt value,
);

abstract class ContractServiceRepository {
  EthPrivateKey getCredentials(String privateKey);
  Future<String?> send(
      String privateKey, EthereumAddress receiver, BigInt amount,
      {TransferEvent? onTransfer, Function(Object exeception)? onError});
  Future<BigInt> getTokenBalance(EthereumAddress from);
  Future<EtherAmount> getEthBalance(EthereumAddress from);
  Future<void> dispose();
  StreamSubscription listenTransfer(TransferEvent onTransfer);
}