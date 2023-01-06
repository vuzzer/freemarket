import 'package:defi/domain/entities/wallet_transfer.dart';
import 'package:defi/domain/transfer/wallet_transfer_action.dart';




class WalletTransferConfirmed implements WalletTransferAction {}

WalletTransfer reducer(WalletTransfer state, WalletTransferAction action) {
  if (action is WalletTransferInit) {
    return WalletTransfer();
  }

  if (action is WalletTransferStarted) {
    return state.rebuild((b) => b
      ..errors.clear()
      ..status = WalletTransferStatus.started
      ..loading = true);
  }

  if (action is WalletTransferError) {
    return state.rebuild((b) => b
      ..status = WalletTransferStatus.none
      ..errors.add(action.error)
      ..loading = false);
  }

  return state;
}
