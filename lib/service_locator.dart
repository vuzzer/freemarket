import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:defi/data/datasource/active_notification_data.dart';
import 'package:defi/data/datasource/brightness_data.dart';
import 'package:defi/data/datasource/crypto_info_source.dart';
import 'package:defi/data/datasource/favoris_crypto_data.dart';
import 'package:defi/data/datasource/token_market_datasource.dart';
import 'package:defi/data/repositories/active_notification_repo_impl.dart';
import 'package:defi/data/repositories/brightness_repo_impl.dart';
import 'package:defi/data/repositories/crypto_info_repo_impl.dart';
import 'package:defi/data/repositories/favoris_crypto_repo_impl.dart';
import 'package:defi/data/repositories/primary_crypto_repo_impl.dart';
import 'package:defi/data/repositories/token_market_repository.dart';
import 'package:defi/domain/repositories/active-notification/active_notification_repo.dart';
import 'package:defi/domain/repositories/brightness/brightness_repo.dart';
import 'package:defi/domain/repositories/crypto-info/crypto_info_repo.dart';
import 'package:defi/domain/repositories/favoris/favoris_crypto_repo.dart';
import 'package:defi/domain/repositories/market/token_market_repo.dart';
import 'package:defi/domain/repositories/primary-crypto/primary_crypto_repo.dart';
import 'package:defi/domain/usecases/active-notification/active_notification_usecase.dart';
import 'package:defi/domain/usecases/brightness/brightness_usecases.dart';
import 'package:defi/domain/usecases/clientProfil/clientProfil_usecase.dart';
import 'package:defi/domain/usecases/crypto-info/crypto_info_usecases.dart';
import 'package:defi/domain/usecases/favoris/favoris_crypto_usecase.dart';
import 'package:defi/domain/usecases/market/token_market_usecase.dart';
import 'package:defi/domain/usecases/notification-price/notification_price_usecase.dart';
import 'package:defi/domain/usecases/primary-crypto/primary_crypto_usecase.dart';
import 'package:defi/domain/usecases/setup/wallet_setup_handler.dart';
import 'package:defi/presentation/blocs/active-notification/active_notification_bloc.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/client/client_profil_bloc.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/blocs/notification-triggered/notification_triggered_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/services/address_service.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/notification/notification_price_data.dart';
import 'data/datasource/primary_crypto_data.dart';
import 'data/repositories/notification/notification_repo_impl.dart';
import 'domain/repositories/notification-crypto/notification_price_repo.dart';

GetIt sl = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final configurationService = ConfigurationService(sharedPrefs);
  final addressService = AddressService(configurationService);

  //INJECT CONFIGURATIONSERVICE
  sl.registerLazySingleton<ConfigurationService>(
      () => ConfigurationService(sharedPrefs));

  //INJECT WalletSetupHandler
  sl.registerLazySingleton<WalletSetupHandler>(
      () => WalletSetupHandler(addressService));
}

Future<void> configApp() async {
  //! Local Database
  await Hive.initFlutter();

  //! Bloc client
  sl.registerFactory(() => ClientProfilBloc(clientProfilUsecase: sl()));
  sl.registerFactory(() => MarketTokenBloc(tokenMarketUsecase: sl()));
  sl.registerLazySingleton(() => CryptosBloc(cryptoInfoUseCase: sl()));
  sl.registerFactory(() => FavorisBloc(favorisCryptoUsecase: sl()));
  sl.registerFactory(() => PrimaryCryptoBloc(primaryCryptoUsecase: sl()));
  sl.registerLazySingleton(() => NotificationPriceBloc(
      notificationPriceUsecase: sl())); // for notification based price
  sl.registerLazySingleton(
      () => ActiveNotificationBloc(activeNotificationUsecase: sl()));
  sl.registerLazySingleton(() => NotificationTriggeredBloc());
  sl.registerLazySingleton(() => BrightnessBloc(sl()));

  //! Usecases
  sl.registerLazySingleton(() => ClientProfilUsecase(sl()));
  sl.registerLazySingleton(() => TokenMarketUsecase(sl()));
  sl.registerLazySingleton(() => CryptoInfoUseCase(sl()));
  sl.registerLazySingleton(() => FavorisCryptoUsecase(sl()));
  sl.registerLazySingleton(() => PrimaryCryptoUsecase(sl()));
  // Notification based price usecases
  sl.registerLazySingleton(() => NotificationPriceUsecase(sl()));
  sl.registerLazySingleton(() => ActiveNotificationUsecase(sl()));
   sl.registerLazySingleton(() => BrightnessUsecases(sl()));

  //! Repositories
  sl.registerLazySingleton<TokenMarketRepository>(() =>
      TokenMarketRepositoryImpl(
          tokenMarketDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CryptoInfoRepo>(() => CryptoInfoRepoImpl(sl()));
  sl.registerLazySingleton<FavorisCryptoRepo>(
      () => FavorisCryptoRepoImpl(sl()));
  sl.registerLazySingleton<PrimaryCryptoRepo>(
      () => PrimaryCryptoRepoImpl(sl()));
  // Notification based price repo
  sl.registerLazySingleton<NotificationPriceRepo>(
      () => NotificationPriceRepoImpl(notificationPriceData: sl()));
  sl.registerLazySingleton<ActiveNotificationRepo>(
      () => ActiveNotificationRepoImpl(sl()));
    sl.registerLazySingleton<BrightnessRepo>(
      () => BrightnessRepoImpl(sl()));

  //! Data
  sl.registerLazySingleton<TokenMarketDataSource>(
      () => TokenMarketDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<CryptoInfoSource>(() => CryptoInfoSourceImpl(sl()));
  sl.registerLazySingleton<FavorisCryptoData>(() => FavorisCryptoDataImpl());
  sl.registerLazySingleton<PrimaryCryptoData>(() => PrimaryCryptoDataImpl());
  // Notification based price data
  sl.registerLazySingleton<NotificationPriceData>(
      () => NotificationPriceDataImpl());
  sl.registerLazySingleton<ActiveNotificationData>(
      () => ActiveNotificationDataImpl());
    sl.registerLazySingleton<BrightnessData>(
      () => BrightnessDataImpl());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl())); // For stream

  //! Notification
  sl.registerLazySingleton(() => SetupNotification(sl())); // For notification

  //! External
  sl.registerLazySingleton(() => AwesomeNotifications());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
