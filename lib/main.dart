import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/firebase_options.dart';
import 'package:defi/get_routes.dart';
import 'package:defi/presentation/provider/network_provider.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/started_screen.dart';
import 'package:defi/presentation/screens/verification_screen.dart';
import 'package:defi/services/service_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));

   final stores = await createProviders();

  runApp( MultiProvider(providers: [
    ...stores,
      ChangeNotifierProvider(create: (context) => UserProvider(), 
      child: const VerificationScreen()),
      Provider(create: (context) => NetworkProvider())
  ], 
  child: WalletProvider(builder: (context, store) =>  const MyApp())));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);
    final address = store.state.address;
    final network = store.state.network;

    useEffect(() {
      store.initialise();
      return null;
    }, []);

    useEffect(
      () => store.listenTransfers(address, network),
      [address, network],
    );

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
                      headline6: const TextStyle(
                        fontFamily: "RobotoCondensed",
                      ),
                      headline3: const TextStyle(
                          fontSize: 37,
                          fontFamily: "RobotoCondensed",
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      headline4: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                      bodyText1: const TextStyle(color: Colors.white),
                      
                      bodyText2:
                          TextStyle(color: Colors.grey.withOpacity(0.6)))),
              initialRoute: StartedScreen.routeName,
              routes: getRoutes(context)
            )));
  }
}
