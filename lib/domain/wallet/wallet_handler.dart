import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/entities/wallet.dart';
import 'package:defi/domain/super_wallet.dart';
import 'package:defi/domain/wallet/wallet_action.dart';
import 'package:defi/services/address_service.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:defi/services/contract_locator.dart';
import 'package:web3dart/web3dart.dart' as web3;
import 'package:logger/logger.dart';
import 'wallet_state.dart';

var logger = Logger();

//Refactor the code
//Replace _store.dispatch() by setState

class WalletHandler extends WalletState {
  WalletHandler(
    this._addressService,
    this._contractLocator,
    this._configurationService,
  );

  //final Store<Wallet, WalletAction> _store;
  final AddressService _addressService;
  final ConfigurationService _configurationService;
  final ContractLocator _contractLocator;

  SuperWallet get states => state;

  Future<void> initialise() async {
    //logger.d(network);

    final entropyMnemonic = _configurationService.getMnemonic();
    final privateKey = _configurationService.getPrivateKey();

    if (entropyMnemonic != null && entropyMnemonic.isNotEmpty) {
      _initialiseFromMnemonic(entropyMnemonic);
      return;
    }
    if (privateKey != null && privateKey.isNotEmpty) {
      _initialiseFromPrivateKey(privateKey);
      return;
    }

    throw Exception('Wallet could not be initialised.');
  }

  Future<void> _initialiseFromMnemonic(String entropyMnemonic) async {
    final mnemonic = _addressService.entropyToMnemonic(entropyMnemonic);
    final privateKey = await _addressService.getPrivateKey(mnemonic);
    final address = await _addressService.getPublicAddress(privateKey);

    //Replace this _store.dispatch with setState
    //_store.dispatch(InitialiseWallet(network, address.toString(), privateKey));

    setState(InitialiseWallet(address.toString(), privateKey));

    await refreshBalance();
  }

  Future<void> _initialiseFromPrivateKey(String privateKey) async {
    final address = await _addressService.getPublicAddress(privateKey);

    //_store.dispatch(InitialiseWallet(network, address.toString(), privateKey));
    setState(InitialiseWallet(address.toString(), privateKey));

    await refreshBalance();
  }

  Function()?  listenTransfers(String? address, NetworkType network) {
    if (address == null || address.isEmpty) {
      return null;
    }

    final subscription = _contractLocator
        .getInstance(network)
        .listenTransfer((from, to, value) async {
      final fromMe = from.toString() == address;
      final toMe = to.toString() == address;

      if (!fromMe && !toMe) {
        return;
      }

      print('======= balance updated =======');

      await refreshBalance();
    });

    return subscription.cancel;
  }

  Future<void> changeNetwork(NetworkType network) async {
    //_store.dispatch(NetworkChanged(network));
    setState(NetworkChanged(network));
    await refreshBalance();
  }

  Future<void> refreshBalance() async {
    //logger.d(network);

    if (state.address?.isEmpty ?? true) {
      return;
    }

    for (NetworkType network in NetworkType.enabledValues) {
      final contractService = _contractLocator.getInstance(network);

      //_store.dispatch(UpdatingBalance());
      //setState(UpdatingBalance(network));

      final tokenBalance = await contractService
          .getTokenBalance(web3.EthereumAddress.fromHex(state.address!));

      //logger.d(tokenBalance);

      final ethBalance = await contractService
          .getEthBalance(web3.EthereumAddress.fromHex(state.address!));

      //_store.dispatch(BalanceUpdated(ethBalance.getInWei, tokenBalance));
      setState(BalanceUpdated(network, ethBalance.getInWei, tokenBalance));
    }
  }

  Future<void> resetWallet() async {
    await _configurationService.setMnemonic(null);
    await _configurationService.setupDone(false);
  }

  String? getPrivateKey() {
    return _configurationService.getPrivateKey();
  }
}
