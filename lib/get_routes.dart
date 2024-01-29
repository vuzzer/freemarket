import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/screens/base_screen.dart';
import 'package:defi/presentation/screens/choose_currency_screen.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/screens/confirm_deposit_screen.dart';
import 'package:defi/presentation/screens/deposit_screen.dart';
import 'package:defi/presentation/screens/home_screen.dart';
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
import 'package:defi/presentation/screens/withdraw_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes(context) {

  return {
    StartedScreen.routeName: (context) {
      return const StartedScreen();
    },
    QRCodeReaderScreen.routeName: (context) => QRCodeReaderScreen(
          onScanned: ModalRoute.of(context)?.settings.arguments as OnScanned?,
        ),
    WithDrawScreen.routeName: (context) => const WithDrawScreen(),
    LoginScreen.routeName: ((context) => const LoginScreen()),
    VerificationScreen.routeName: (context) => const VerificationScreen(),
    SecretCodeScreen.routeName: (context) => const SecretCodeScreen(),
    OtpScreen.routeName: (context) => const OtpScreen(),
    TxInfoScreen.routeName: (context) => const TxInfoScreen(),
    CryptoAssetScreen.routeName: (context) => const CryptoAssetScreen(),
    ChooseCurrencyScreen.routeName: (context) => const ChooseCurrencyScreen(),
    SetAmountScreen.routeName: (context) => const SetAmountScreen(),
    SendScreen.routeName: (context) => const SendScreen(),
    ReceiveScreen.routeName: (context) => const ReceiveScreen(),
    QrScanScreen.routeName: (context) => const QrScanScreen(),
    SwapScreen.routeName: (context) => const SwapScreen(),
    SettingScreen.routeName: (context) => const SettingScreen(),
    ConfirmDepositScreen.routeName: (context) => const ConfirmDepositScreen(),
    DepositScreen.routeName: (context) => const DepositScreen(),
    HomeScreen.routeName: (BuildContext context) {
      return const HomeScreen();
    },
  };
}
