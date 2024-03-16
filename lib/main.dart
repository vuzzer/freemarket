import 'package:defi/core/background/background_service.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:defi/firebase_options.dart';
import 'package:defi/get_routes.dart';
import 'package:defi/presentation/blocs/active-notification/active_notification_bloc.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/blocs/notification-triggered/notification_triggered_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/presentation/provider/network_provider.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_family.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  // Create bloc and service
  await configApp();

  //! Background service
  await BackgroundService.initialize();

  // Firebase configuration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Dark therme for mobile app 
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));

  // Date Format
  await initializeDateFormatting(Intl.getCurrentLocale(), null);

  // Notification configuration
  await sl<SetupNotification>().initialize();

  // Running app
  runApp(MultiBlocProvider(providers: [
    Provider(create: (context) => NetworkProvider()),
    BlocProvider(create: (context) => sl<MarketTokenBloc>()),
    BlocProvider(create: (context) => sl<ActiveNotificationBloc>()),
    BlocProvider(create: (context) => sl<CryptosBloc>()),
    BlocProvider(create: (context) => sl<FavorisBloc>()),
    BlocProvider(create: (context) => sl<NotificationPriceBloc>()),
    BlocProvider(create: (context) => sl<PrimaryCryptoBloc>()),
    BlocProvider(create: (context) => sl<NotificationTriggeredBloc>())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) => GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: const Center(
              child: SpinKitCubeGrid(
                color: Colors.white,
                size: 50.0,
              ),
            ),
            child: MaterialApp(
                title: 'Freemarket',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Colors.white,
                    fontFamily: 'Raleway',
                    scaffoldBackgroundColor: const Color(0XFF171B2F),
                    splashFactory: InkRipple.splashFactory,
                    textTheme: TextTheme(
                        headlineLarge: TextStyle(
                          fontFamily: FontFamily.robotoCondensed,
                        ),
                        headlineMedium: TextStyle(
                            fontSize: 37,
                            fontFamily: FontFamily.robotoCondensed,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        headlineSmall: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        // For token price details
                        bodySmall: const TextStyle(color: Colors.white),
                        displayMedium: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontSize: 20,
                            fontFamily: FontFamily.robotoCondensed),
                        bodyLarge:
                            TextStyle(color: Colors.grey.withOpacity(0.6)),
                        bodyMedium:
                            TextStyle(color: Colors.grey.withOpacity(0.6)))),
                routes: getRoutes(context))));
  }
}
