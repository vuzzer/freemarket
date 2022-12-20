import 'package:defi/domain/setup/wallet_setup_provider.dart';
import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/presentation/screens/choose_currency_screen.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/screens/login_screen.dart';
import 'package:defi/presentation/screens/otp_screen.dart';
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
import 'package:defi/services/configuration_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    StartedScreen.routeName: (context) {
      final configurationService = Provider.of<ConfigurationService>(context);
      if (configurationService.didSetupWallet()) {
        return WalletProvider(builder: (context, store) => ThetaScreen());
      }
      return const StartedScreen();
    },
    LoginScreen.routeName: ((context) => const LoginScreen()),
    VerificationScreen.routeName: (context) => const VerificationScreen(),
    SecretCodeScreen.routeName: (context) => const SecretCodeScreen(),
    OtpScreen.routeName: (context) => const OtpScreen(),
    TxInfoScreen.routeName: (context) => const TxInfoScreen(),
    CryptoAssetScreen.routeName: (context) => const CryptoAssetScreen(),
    ChooseCurrencyScreen.routeName: (context) =>  const ChooseCurrencyScreen(),
    SetAmountScreen.routeName: (context) => const SetAmountScreen(),
    SendScreen.routeName: (context) => const SendScreen(),
    ReceiveScreen.routeName: (context) =>  const ReceiveScreen(),
    QrScanScreen.routeName: (context) => const QrScanScreen(),
    SwapScreen.routeName: (context) => const SwapScreen(),
    SettingScreen.routeName: (context) => const SettingScreen(),
    ThetaScreen.routeName: (BuildContext context) {
      final configurationService = Provider.of<ConfigurationService>(context);
      if (configurationService.didSetupWallet()) {
        return  ThetaScreen();
      }

      return WalletSetupProvider(builder: (context, store) {
        // ignore: body_might_complete_normally_nullable
        useEffect(() {
          store.generateMnemonic();
        }, []);

        return ThetaScreen();
      });
    },
  };
}
