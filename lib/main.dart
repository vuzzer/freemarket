import 'package:defi/core/background/background_service.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:defi/firebase_options.dart';
import 'package:defi/get_routes.dart';
import 'package:defi/presentation/blocs/active-notification/active_notification_bloc.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/blocs/notification-triggered/notification_triggered_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/presentation/provider/network_provider.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/my_theme_mode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await setupLocator();

  // Create bloc and service
  await configApp();

  //! Background service
  await BackgroundService.initialize();

  // Firebase configuration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Date Format
  await initializeDateFormatting(Intl.getCurrentLocale(), null);

  // Notification configuration
  await sl<SetupNotification>().initialize();

  // Running app
  runApp(MultiBlocProvider(providers: [
    Provider(create: (context) => NetworkProvider()),
    BlocProvider(create: (context) => sl<MarketTokenBloc>()),
    BlocProvider(
        create: (context) =>
            sl<ActiveNotificationBloc>()..add(const GetActiveNotification())),
    BlocProvider(create: (context) => sl<CryptosBloc>()),
    BlocProvider(
        create: (context) => sl<FavorisBloc>()..add(LoadFavorisEvent())),
    BlocProvider(create: (context) => sl<NotificationPriceBloc>()),
    BlocProvider(
        create: (context) => sl<PrimaryCryptoBloc>()
          ..add(const PrimaryCryptoEvent.getPrimaryCrypto())),
    BlocProvider(create: (context) => sl<NotificationTriggeredBloc>()),
    BlocProvider(create: (context) => sl<BrightnessBloc>())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    sl<BrightnessBloc>().add(const GetBrightness());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) => GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidgetBuilder: (_) => const Center(
                  child: SpinKitCubeGrid(
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
            child: BlocBuilder<BrightnessBloc, BrightnessState>(
                builder: (context, state) {
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarBrightness: state.brightness == Mode.dark
                    ? Brightness.dark
                    : Brightness.light,
              ));
              return MaterialApp(
                  title: 'Freemarket',
                  debugShowCheckedModeBanner: false,
                  theme: MyThemeMode.themeData(),
                  routes: getRoutes(context));
            })));
  }
}
