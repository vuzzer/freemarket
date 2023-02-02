import 'package:defi/domain/entities/wallet_transfer.dart';
import 'package:defi/domain/setup/wallet_setup_handler.dart';
import 'package:defi/domain/transfer/wallet_transfer_handler.dart';
import 'package:defi/domain/wallet/wallet_handler.dart';
import 'package:defi/services/address_service.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:defi/services/contract_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final configurationService = ConfigurationService(sharedPrefs);
  final addressService = AddressService(configurationService);
  final contractLocator = await ContractLocator.setup();

  //INJECT CONFIGURATIONSERVICE
  sl.registerLazySingleton<ConfigurationService>(
      () => ConfigurationService(sharedPrefs));

  //INJECT WalletHandler
  sl.registerLazySingleton<WalletHandler>(() =>
      WalletHandler(addressService, contractLocator, configurationService));

  //INJECT WalletTransferHandler
  sl.registerLazySingleton<WalletTransferHandler>(
      () => WalletTransferHandler(contractLocator, configurationService));
    
  //INJECT WalletSetupHandler
  sl.registerLazySingleton<WalletSetupHandler>(() => WalletSetupHandler(addressService) );
}
