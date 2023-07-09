import 'package:defi/domain/entities/wallet_setup.dart';

abstract class WalletSetupAction {}

class WalletSetupInit implements WalletSetupAction {}

class WalletSetupConfirmMnemonic implements WalletSetupAction {
  WalletSetupConfirmMnemonic(this.mnemonic);
  final String mnemonic;
}

class WalletSetupChangeStep implements WalletSetupAction {
  WalletSetupChangeStep(this.step);
  final WalletCreateSteps step;
}

class WalletSetupAddError implements WalletSetupAction {
  WalletSetupAddError(this.error);
  final String error;
}

class WalletSetupChangeMethod implements WalletSetupAction {
  WalletSetupChangeMethod(this.method);
  final WalletSetupMethod method;
}

class WalletSetupStarted implements WalletSetupAction {}