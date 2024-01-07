import 'package:defi/core/database/client_profil_collection.dart';
import 'package:defi/data/datasource/client_profil_source.dart';
import 'package:defi/data/repositories/client_profil_repository_impl.dart';
import 'package:defi/domain/usecases/clientProfil/clientProfil_usecase.dart';
import 'package:defi/domain/usecases/setup/wallet_setup_handler.dart';
import 'package:defi/domain/usecases/wallet/wallet_handler.dart';
import 'package:defi/presentation/blocs/client/client_profil_bloc.dart';
import 'package:defi/services/address_service.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:defi/services/contract_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/repositories/clientProfil/clientProfil_repository.dart';
import 'domain/usecases/transfer/wallet_transfer_handle.dart';

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
  sl.registerLazySingleton<WalletSetupHandler>(
      () => WalletSetupHandler(addressService));
}

Future<void> injectionBloc() async {
  //! Bloc client
  sl.registerFactory(() => ClientProfilBloc(clientProfilUsecase: sl()));

  // Usecases
  sl.registerLazySingleton(() => ClientProfilUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientProfilRepository>(() => ClientProfilRepositoryImpl(sl()));

  // Data
  sl.registerLazySingleton<ClientProfilDataSource>(() => ClientProfilDataSourceImpl(sl()));

  //! Database
  sl.registerLazySingleton(() => ClientProfilCollection());
}
