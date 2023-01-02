import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/entities/wallet.dart';
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

  Wallet get states => state;

  Future<void> initialise() async {
    //logger.d(network);

    final entropyMnemonic = _configurationService.getMnemonic();
    final privateKey = _configurationService.getPrivateKey();

    if (entropyMnemonic != null && entropyMnemonic.isNotEmpty) {
      _initialiseFromMnemonic(NetworkType.BSC, entropyMnemonic);
      return;
    }
    if (privateKey != null && privateKey.isNotEmpty) {
      _initialiseFromPrivateKey(states.network, privateKey);
      return;
    }

    throw Exception('Wallet could not be initialised.');
  }

  Future<void> _initialiseFromMnemonic(
      NetworkType network, String entropyMnemonic) async {
    final mnemonic = _addressService.entropyToMnemonic(entropyMnemonic);
    final privateKey = await _addressService.getPrivateKey(mnemonic);
    final address = await _addressService.getPublicAddress(privateKey);

    //Replace this _store.dispatch with setState
    //_store.dispatch(InitialiseWallet(network, address.toString(), privateKey));

    setState(InitialiseWallet(network, address.toString(), privateKey));

    await refreshBalance(network);
  }

  Future<void> _initialiseFromPrivateKey(
      NetworkType network, String privateKey) async {
    final address = await _addressService.getPublicAddress(privateKey);

    //_store.dispatch(InitialiseWallet(network, address.toString(), privateKey));
    setState(InitialiseWallet(network, address.toString(), privateKey));

    await refreshBalance(network);
  }

  Function()? listenTransfers(String? address, NetworkType network) {
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

      await refreshBalance(network);
    });

    return subscription.cancel;
  }

  Future<void> changeNetwork(NetworkType network) async {
    //_store.dispatch(NetworkChanged(network));
    setState(NetworkChanged(network));
    await refreshBalance(network);
  }

  Future<void> refreshBalance(NetworkType network) async {
    //logger.d(network);

    if (state.address?.isEmpty ?? true) {
      return;
    }

    final contractService = _contractLocator.getInstance(network);

    //_store.dispatch(UpdatingBalance());
    setState(UpdatingBalance());

    final tokenBalance = await contractService
        .getTokenBalance(web3.EthereumAddress.fromHex(state.address!));

    final ethBalance = await contractService
        .getEthBalance(web3.EthereumAddress.fromHex(state.address!));

    //_store.dispatch(BalanceUpdated(ethBalance.getInWei, tokenBalance));
    setState(BalanceUpdated(ethBalance.getInWei, tokenBalance));
  }

  Future<void> resetWallet() async {
    await _configurationService.setMnemonic(null);
    await _configurationService.setupDone(false);
  }

  String? getPrivateKey() {
    return _configurationService.getPrivateKey();
  }
}
