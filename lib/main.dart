import 'dart:io';
import 'package:defi/firebase_options.dart';
import 'package:defi/get_routes.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/provider/network_provider.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/verification_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  await injectionBloc();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));

  HttpOverrides.global = MyHttpOverrides();

/*   runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => UserProvider(), child: const VerificationScreen()),
    Provider(create: (context) => NetworkProvider())
  ], child: const MyApp())); */
    runApp(MultiBlocProvider(providers: [
     ChangeNotifierProvider(
        create: (context) => UserProvider(), child: const VerificationScreen()),
    Provider(create: (context) => NetworkProvider()), 
    BlocProvider(create: (context) => sl<MarketTokenBloc>())
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
                        headlineLarge: const TextStyle(
                          fontFamily: "RobotoCondensed",
                        ),
                        headlineMedium: const TextStyle(
                            fontSize: 37,
                            fontFamily: "RobotoCondensed",
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        headlineSmall: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                        bodyLarge: const TextStyle(color: Colors.white),
                        bodyMedium:
                            TextStyle(color: Colors.grey.withOpacity(0.6)))),
                routes: getRoutes(context))));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
