import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/super_wallet.dart';
import 'package:defi/domain/usecases/wallet/wallet_action.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class WalletState extends ChangeNotifier {
  SuperWallet state = SuperWallet();
  void setState(WalletAction action) {
    if (action is WalletInit) {
      state = SuperWallet();
    }

    if (action is InitialiseWallet) {
      state = state.rebuild((b) => b
        ..address = action.address
        ..privateKey = action.privateKey);
    }

    if (action is NetworkChanged) {
      //state = state.rebuild((b) => b..network = action.network);
    }

    if (action is UpdatingBalance) {
      for (NetworkType network in NetworkType.enabledValues) {
        state.wallets[network] =
            state.wallets[network]!.rebuild((b) => b..loading = true);
      }
    }

    //UPDATE BALANCE FOR A SPECIFIC NETWORK
    if (action is BalanceUpdated) {
        state.wallets[action.network] = state.wallets[action.network]!.rebuild((b) => b
          ..loading = false
          ..ethBalance = action.ethBalance
          ..tokenBalance = action.tokenBalance);
      
    }
    notifyListeners();
  }
}
