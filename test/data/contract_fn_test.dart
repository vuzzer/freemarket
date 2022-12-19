import 'dart:math';

import 'package:defi/data/contract_fn.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:web3dart/web3dart.dart';

var logger = Logger(printer: PrettyPrinter());

void main() {
  final ContractFn contractFn = ContractFn();
  group("ContractFn", () {
    final rnd = Random.secure();
    final Credentials credentials = EthPrivateKey.createRandom(rnd);
    test("Should return the balance of smart contract", () async {
      final output = await contractFn.getContractBalance(credentials);
      logger.d(output);
    });
  });
}
