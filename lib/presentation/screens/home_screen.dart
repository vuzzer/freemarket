import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/presentation/screens/send_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../helpers/crypto_symbols.dart';
import '../widget/button_icon_widget.dart';
import '../widget/card_balance.dart';
import '../widget/theta_body_widget.dart';
import 'choose_currency_screen.dart';


class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: (kFontSizeUnit * 5).h,
          ),
          const CardBalance(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  child: ButtonIconWidget(
                iconData: Icons.arrow_upward,
                label: "Send",
                onPressed: () =>
                    Navigator.of(context).pushNamed(SendScreen.routeName),
              )),
              Flexible(
                  child: ButtonIconWidget(
                iconData: Icons.arrow_downward,
                label: "Receive",
                onPressed: () => Navigator.of(context)
                    .pushNamed(ChooseCurrencyScreen.routeName),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
     
          const ThetaBodyWidget()
        ],
      ),
    );
  }
}
