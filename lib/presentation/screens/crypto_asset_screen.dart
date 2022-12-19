import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/bottom_titles_widget.dart';
import 'package:defi/presentation/widget/crypto_tx_history_widget.dart';
import 'package:defi/presentation/widget/line_chart_widget.dart';
import 'package:defi/presentation/widget/theta_body_widget.dart';
import 'package:defi/presentation/widget/tx_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoAssetScreen extends StatelessWidget {
  static const routeName = "/cryto-asset";
  const CryptoAssetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();
 
    return Scaffold(
      appBar: const AppBarWidget(title: "Ethereum"),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const AutoSizeText(
            "2022 Nov 12",
            style: TextStyle(fontFamily: roboto),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: AutoSizeText(
                "\$ 13.54",
                style: Theme.of(context).textTheme.headline3,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Icon(
                Icons.arrow_drop_up,
                color: Colors.redAccent,
                size: 30,
              ),
              AutoSizeText(
                "50,123.34 XOF (1.23%)",
                style: TextStyle(
                    fontSize: 15, fontFamily: roboto, color: Colors.redAccent),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //Chart
          Container(
            width: size.screenWidth,
            height: 200,
            decoration: const BoxDecoration(color: darkBlue),
            child: const LineChartWidget(),
          ),
          const BottomTitlesWidget(),
          const SizedBox(height: 10,),
          const CryptoTxHistoryWidget()
        ],
      ),
    );
  }
}
