import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/screens/home_screen.dart';
import 'package:defi/presentation/screens/notification_screen.dart';
import 'package:defi/presentation/screens/set_alert_screen.dart';
import 'package:defi/presentation/screens/started_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes(context) {

  return {
    StartedScreen.routeName: (context) {
      return const StartedScreen();
    },
    CryptoAssetScreen.routeName: (context) => const CryptoAssetScreen(),
    ChooseAlertScreen.routeName: (context) => const ChooseAlertScreen(),
    SetAlertScreen.routeName: (context) => const SetAlertScreen(),
    NotificationScreen.routeName: (context) => const NotificationScreen(),
    HomeScreen.routeName: (BuildContext context) {
      return const HomeScreen();
    },
  };
}
