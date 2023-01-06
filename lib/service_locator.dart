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
  sl.registerLazySingleton<ConfigurationService>(() => ConfigurationService(sharedPrefs));

  //INJECT WalletHandler
  sl.registerLazySingleton(() =>
      WalletHandler(addressService, contractLocator, configurationService));
}
