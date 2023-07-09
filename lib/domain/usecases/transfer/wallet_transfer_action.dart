abstract class WalletTransferAction {
  
}

class WalletTransferInit implements WalletTransferAction {}

class WalletTransferStarted implements WalletTransferAction {}

class WalletTransferError implements WalletTransferAction {
  WalletTransferError(this.error);
  final String error;
}

class WalletTransferConfirmed implements WalletTransferAction {}