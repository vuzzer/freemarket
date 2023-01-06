import 'package:defi/domain/entities/wallet_transfer.dart';
import 'package:defi/domain/setup/wallet_setup_action.dart';
import 'package:defi/domain/transfer/wallet_transfer_action.dart';
import 'package:defi/domain/wallet/wallet_action.dart';
import 'package:defi/presentation/screens/choose_currency_screen.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/screens/login_screen.dart';
import 'package:defi/presentation/screens/otp_screen.dart';
import 'package:defi/presentation/screens/qr_code_reader_screen.dart';
import 'package:defi/presentation/screens/qr_scan_screen.dart';
import 'package:defi/presentation/screens/receive_screen.dart';
import 'package:defi/presentation/screens/secret_code_screen.dart';
import 'package:defi/presentation/screens/send_screen.dart';
import 'package:defi/presentation/screens/set_amount_screen.dart';
import 'package:defi/presentation/screens/setting_screen.dart';
import 'package:defi/presentation/screens/started_screen.dart';
import 'package:defi/presentation/screens/swap_screen.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/presentation/screens/tx_info_screen.dart';
import 'package:defi/presentation/screens/verification_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/services/configuration_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    StartedScreen.routeName: (context) {
      final configurationService = sl.get<ConfigurationService>();
      if (configurationService.didSetupWallet()) {
         return ThetaScreen();
      }
      return const StartedScreen();
    },
    QRCodeReaderScreen.routeName:(context) =>  QRCodeReaderScreen(
      onScanned: ModalRoute.of(context)?.settings.arguments as OnScanned?,
    ),
    LoginScreen.routeName: ((context) => const LoginScreen()),
    VerificationScreen.routeName: (context) => const VerificationScreen(),
    SecretCodeScreen.routeName: (context) => const SecretCodeScreen(),
    OtpScreen.routeName: (context) => const OtpScreen(),
    TxInfoScreen.routeName: (context) => const TxInfoScreen(),
    CryptoAssetScreen.routeName: (context) => const CryptoAssetScreen(),
    ChooseCurrencyScreen.routeName: (context) =>  const ChooseCurrencyScreen(),
    SetAmountScreen.routeName: (context) => const SetAmountScreen(),
    SendScreen.routeName: (context) =>   const SendScreen(),
    ReceiveScreen.routeName: (context) =>  const ReceiveScreen(),
    QrScanScreen.routeName: (context) => const QrScanScreen(),
    SwapScreen.routeName: (context) => const SwapScreen(),
    SettingScreen.routeName: (context) => const SettingScreen(),
    ThetaScreen.routeName: (BuildContext context) {
      final configurationService = sl.get<ConfigurationService>();
      if (configurationService.didSetupWallet()) {
        return  ThetaScreen();
      }
        return ThetaScreen();

    },
  };
}
