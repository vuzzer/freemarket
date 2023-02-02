import 'dart:async';
import 'dart:math';

import 'package:defi/domain/repositories/contact_service_repository.dart';
import 'package:web3dart/web3dart.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ContractService implements ContractServiceRepository {
  ContractService(this.client, this.contract);

  final Web3Client client;
  final DeployedContract contract;

  ContractEvent _transferEvent() => contract.event('Transfer');
  ContractFunction _balanceFunction() => contract.function('balanceOf');
  ContractFunction _sendFunction() => contract.function('transfer');

  @override
  EthPrivateKey getCredentials(String privateKey) =>
      EthPrivateKey.fromHex(privateKey);

  @override
  Future<String?> send(
      String privateKey, EthereumAddress receiver, BigInt amount,
      {TransferEvent? onTransfer, Function(Object exeception)? onError}) async {
    final credentials = getCredentials(privateKey);
    final from = credentials.address;
    final networkId = await client.getNetworkId();

    //logger.d();

    StreamSubscription? event;
    // Workaround once sendTransacton doesn't return a Promise containing confirmation / receipt
    if (onTransfer != null) {
      event = listenTransfer((from, to, value) async {
        onTransfer(from, to, value);
        await event?.cancel();
      }, take: 1);
    }

    try {
      final transactionId = await client.sendTransaction(
        credentials,
        Transaction.callContract(
            contract: contract,
            function: _sendFunction(),
            parameters: [receiver, amount],
            from: from,
             ),
        chainId: networkId,
      );
      logger.d('transact started $transactionId');
      return transactionId;
    } catch (ex) {
      if (onError != null) {
        onError(ex);
      }
      return null;
    }
  }

  @override
  Future<EtherAmount> getEthBalance(EthereumAddress from) async {
    return client.getBalance(from);
  }

  @override
  Future<BigInt> getTokenBalance(EthereumAddress from) async {
    final response = await client.call(
      contract: contract,
      function: _balanceFunction(),
      params: [from],
    );

    return response.first as BigInt;
  }

  @override
  StreamSubscription listenTransfer(TransferEvent onTransfer, {int? take}) {
    var events = client.events(FilterOptions.events(
      contract: contract,
      event: _transferEvent(),
    ));

    if (take != null) {
      events = events.take(take);
    }

    return events.listen((event) {
      if (event.topics == null || event.data == null) {
        return;
      }

      final decoded =
          _transferEvent().decodeResults(event.topics!, event.data!);

      final from = decoded[0] as EthereumAddress;
      final to = decoded[1] as EthereumAddress;
      final value = decoded[2] as BigInt;

      logger.d('$from}');
      logger.d('$to}');
      logger.d('$value}');

      onTransfer(from, to, value);
    });
  }

  @override
  Future<void> dispose() async {
    await client.dispose();
  }
}
