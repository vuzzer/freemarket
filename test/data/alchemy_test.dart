import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:defi/data/rpcnode/alchemy.dart';
import 'package:logger/logger.dart';
import 'package:web3dart/web3dart.dart';

var logger = Logger(printer: PrettyPrinter());

void main() {
  group("Alchemy", () {
    //generate a private key
    var rnd = Random.secure();
    logger.d(rnd);
    Credentials credentials = EthPrivateKey.createRandom(rnd);
    test("Should return address", () async {
      var address = await credentials.extractAddress();
      logger.d(address);
      Alchemy alchemy = Alchemy();
      await alchemy.getBalance(address);
    });
  });
}
