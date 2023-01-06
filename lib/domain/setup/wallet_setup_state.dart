import 'package:defi/domain/entities/wallet_setup.dart';
import 'package:defi/domain/setup/wallet_setup_action.dart';
import 'package:flutter/foundation.dart';

class WalletSetupState extends ChangeNotifier {
  WalletSetup state = WalletSetup();
  void setState(WalletSetupAction action) {
    if (action is WalletSetupInit) {
      state = WalletSetup();
    }

    if (action is WalletSetupConfirmMnemonic) {
      state = state.rebuild((b) => b
        ..mnemonic = action.mnemonic
        ..loading = true
        ..errors.clear());
    }

    if (action is WalletSetupStarted) {
      state = state.rebuild((b) => b
        ..errors.clear()
        ..loading = true);
    }

    if (action is WalletSetupChangeStep) {
      state = state.rebuild((b) => b
        ..step = action.step
        ..loading = false
        ..errors.clear());
    }

    if (action is WalletSetupChangeMethod) {
      state = state.rebuild((b) => b
        ..method = action.method
        ..loading = false
        ..errors.clear());
    }

    if (action is WalletSetupAddError) {
      state = state.rebuild((b) => b
        ..loading = false
        ..errors.clear()
        ..errors.add(action.error));
    }

    notifyListeners();
  }
}
