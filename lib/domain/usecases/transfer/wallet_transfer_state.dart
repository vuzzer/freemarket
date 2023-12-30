import 'package:defi/domain/entities/transaction.dart';
import 'package:defi/domain/usecases/transfer/wallet_transfer_action.dart';
import 'package:flutter/foundation.dart';

class WalletTransferState extends ChangeNotifier {
  Transaction state = Transaction();
  void setState(WalletTransferAction action) {
    if (action is WalletTransferInit) {
      state = Transaction();
    }

    if (action is WalletTransferStarted) {
      state = state.rebuild((b) => b
        ..errors.clear()
        ..status = WalletTransferStatus.started
        ..loading = true);
    }

    if (action is WalletTransferError) {
      state = state.rebuild((b) => b
        ..status = WalletTransferStatus.none
        ..errors.add(action.error)
        ..loading = false);
    }

    notifyListeners();
  }
}