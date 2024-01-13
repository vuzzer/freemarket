import 'package:defi/core/database/client_profil_collection.dart';
import 'package:defi/data/datasource/client_profil_source.dart';
import 'package:defi/data/datasource/token_market_datasource.dart';
import 'package:defi/data/repositories/client_profil_repository_impl.dart';
import 'package:defi/data/repositories/token_market_repository.dart';
import 'package:defi/domain/repositories/market/token_market_repo.dart';
import 'package:defi/domain/usecases/clientProfil/clientProfil_usecase.dart';
import 'package:defi/domain/usecases/market/token_market_usecase.dart';
import 'package:defi/domain/usecases/setup/wallet_setup_handler.dart';
import 'package:defi/domain/usecases/wallet/wallet_handler.dart';
import 'package:defi/presentation/blocs/client/client_profil_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/services/address_service.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:defi/services/contract_locator.dart';
import 'package:dio/dio.dart';
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
  sl.registerFactory(() => MarketTokenBloc(tokenMarketUsecase: sl()));

  // Usecases
  sl.registerLazySingleton(() => ClientProfilUsecase(sl()));
  sl.registerLazySingleton(() => TokenMarketUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<ClientProfilRepository>(
      () => ClientProfilRepositoryImpl(sl()));
  sl.registerLazySingleton<TokenMarketRepository>(
      () => TokenMarketRepositoryImpl(sl()));

  // Data
  sl.registerLazySingleton<ClientProfilDataSource>(
      () => ClientProfilDataSourceImpl(sl()));
  sl.registerLazySingleton<TokenMarketDataSource>(
      () => TokenMarketDataSourceImpl(dio: sl()));

  //! Database
  sl.registerLazySingleton(() => ClientProfilCollection());
  sl.registerLazySingleton(() => Dio());
}
