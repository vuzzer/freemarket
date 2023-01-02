import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:defi/domain/wallet/wallet_action.dart';
import 'package:flutter/material.dart';



class WalletState extends ChangeNotifier {
  Wallet state = Wallet();
  void setState(WalletAction action) {
    if (action is WalletInit) {
      state = Wallet();
    }

    if (action is InitialiseWallet) {
      state = state.rebuild((b) => b
        ..network = action.network
        ..address = action.address
        ..privateKey = action.privateKey);
    }

    if (action is NetworkChanged) {
      state = state.rebuild((b) => b..network = action.network);
    }

    if (action is UpdatingBalance) {
      state = state.rebuild((b) => b..loading = true);
    }

    if (action is BalanceUpdated) {
      state = state.rebuild((b) => b
        ..loading = false
        ..ethBalance = action.ethBalance
        ..tokenBalance = action.tokenBalance);
    }
    notifyListeners();
  }
}

