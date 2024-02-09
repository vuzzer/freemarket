import 'package:defi/core/notifications/alert_notification.dart';
import 'package:defi/firebase_options.dart';
import 'package:defi/get_routes.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/presentation/provider/network_provider.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/verification_screen.dart';
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

  await injectionBloc();

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
  await sl<AlertNotification>().initialize();

  // Running app
  runApp(MultiBlocProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => UserProvider(), child: const VerificationScreen()),
    Provider(create: (context) => NetworkProvider()),
    BlocProvider(create: (context) => sl<MarketTokenBloc>()),
    BlocProvider(create: (context) => sl<CryptosBloc>()),
    BlocProvider(create: (context) => sl<FavorisBloc>()),
    BlocProvider(create: (context) => sl<PrimaryCryptoBloc>())
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
                title: 'Flutter Demo',
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
