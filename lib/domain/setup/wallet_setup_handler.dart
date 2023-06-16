import 'dart:async';
import 'package:defi/domain/entities/wallet_setup.dart';
import 'package:defi/domain/setup/wallet_setup_action.dart';
import 'package:defi/services/address_service.dart';

import 'wallet_setup_state.dart';

class WalletSetupHandler extends WalletSetupState {
  WalletSetupHandler(this._addressService);

  final AddressService _addressService;

  WalletSetup get states => state;

  void generateMnemonic() {
    final mnemonic = _addressService.generateMnemonic();
    print(mnemonic);
    //_store.dispatch(WalletSetupConfirmMnemonic(mnemonic));
    setState(WalletSetupConfirmMnemonic(mnemonic));
  }

  Future<bool> confirmMnemonic(String mnemonic) async {
    if (states.mnemonic != mnemonic) {
      //_store.dispatch(WalletSetupAddError('Invalid mnemonic, please try again.'));
      setState(WalletSetupAddError('Invalid mnemonic, please try again.'));
      return false;
    }
    //_store.dispatch(WalletSetupStarted());
    setState(WalletSetupStarted());
    await _addressService.setupFromMnemonic(mnemonic);

    return true;
  }

  void goto(WalletCreateSteps step) {
    //_store.dispatch(WalletSetupChangeStep(step));
    setState(WalletSetupChangeStep(step));
  }

  Future<bool> importFromMnemonic(String mnemonic) async {
    try {
      //_store.dispatch(WalletSetupStarted());
      setState(WalletSetupStarted());
      if (_validateMnemonic(mnemonic)) {
        final normalisedMnemonic = _mnemonicNormalise(mnemonic);
        await _addressService.setupFromMnemonic(normalisedMnemonic);
        return true;
      }
    } catch (e) {
      //_store.dispatch(WalletSetupAddError(e.toString()));
      setState(WalletSetupAddError(e.toString()));
    }

    //_store.dispatch(WalletSetupAddError('Invalid mnemonic, it requires 12 words.'));
    setState(WalletSetupAddError('Invalid mnemonic, it requires 12 words.'));

    return false;
  }

  Future<bool> importFromPrivateKey(String privateKey) async {
    try {
      //_store.dispatch(WalletSetupStarted());
      setState(WalletSetupStarted());
      await _addressService.setupFromPrivateKey(privateKey);
      return true;
    } catch (e) {
      //_store.dispatch(WalletSetupAddError(e.toString()));
      setState(WalletSetupAddError(e.toString()));
    }

    //_store.dispatch(WalletSetupAddError('Invalid private key, please try again.'));
    setState(WalletSetupAddError('Invalid private key, please try again.'));

    return false;
  }

  String _mnemonicNormalise(String mnemonic) {
    return _mnemonicWords(mnemonic).join(' ');
  }

  List<String> _mnemonicWords(String mnemonic) {
    return mnemonic
        .split(' ')
        .where((item) => item != null && item.trim().isNotEmpty)
        .map((item) => item.trim())
        .toList();
  }

  bool _validateMnemonic(String mnemonic) {
    return _mnemonicWords(mnemonic).length == 12;
  }
}
