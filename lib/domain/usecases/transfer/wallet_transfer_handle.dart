import 'dart:async';
import 'dart:math';
import 'package:defi/domain/usecases/transfer/wallet_transfer_action.dart';
import 'package:defi/domain/usecases/transfer/wallet_transfer_state.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/entities/transaction.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:defi/services/contract_locator.dart';
import 'package:web3dart/credentials.dart';

import 'package:logger/logger.dart';

var logger = Logger();

class WalletTransferHandler extends WalletTransferState {
  WalletTransferHandler(
    this._contractLocator,
    this._configurationService,
  );

  //final Store<WalletTransfer, WalletTransferAction> _store;
  final ContractLocator _contractLocator;
  final ConfigurationService _configurationService;

  Transaction get states => state;

  Future<bool> transfer(NetworkType network, String to, String amount) async {
    final completer = Completer<bool>();
    final privateKey = _configurationService.getPrivateKey();

    //logger.d(privateKey);

    //_store.dispatch(WalletTransferStarted());
    setState(WalletTransferStarted());
    try {
      await _contractLocator.getInstance(network).send(
        privateKey!,
        EthereumAddress.fromHex(to),
        BigInt.from(double.parse(amount) * pow(10, 18)),
        onTransfer: (from, to, value) {
          completer.complete(true);
        },
        onError: (ex) {
          //_store.dispatch(WalletTransferError(ex.toString()));
          setState(WalletTransferError(ex.toString()));
          completer.complete(false);
        },
      );
    } catch (ex) {
      //_store.dispatch(WalletTransferError(ex.toString()));
      setState(WalletTransferError(ex.toString()));
      completer.complete(false);
    }

    return completer.future;
  }
}