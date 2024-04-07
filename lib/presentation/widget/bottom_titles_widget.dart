import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/params.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/media_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';

class BottomTitlesWidget extends StatelessWidget {
  final ValueNotifier<int> intervalNotifier = ValueNotifier(1);
  final String id;
  BottomTitlesWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);

    final backgroundColor = darkMode ? blue1 : FontColor.white1;
    final sideColor = darkMode ? FontColor.blue : FontColor.black;
    final overlayColor = darkMode ? FontColor.greyLight : FontColor.black;

    final style = TextStyle(
      color: darkMode ? const Color(0xff68737d) : FontColor.black,
      fontWeight: FontWeight.bold,
      fontSize: Media.headline4,
    );

    return Container(
        decoration: BoxDecoration(color: darkMode ? darkBlue : FontColor.white),
        child: ValueListenableBuilder(
            valueListenable: intervalNotifier,
            builder: (context, interval, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (intervalNotifier.value != IntervalChart.day) {
                            intervalNotifier.value = IntervalChart.day;
                            context.read<MarketTokenBloc>().add(GetTokenPrice(
                                Params(
                                    idToken: id,
                                    periode: IntervalChart.day,
                                    currentOfMarket: "usd")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            overlayColor: overlayColor,
                            backgroundColor: backgroundColor,
                            elevation: 0.1,
                            shape: RoundedRectangleBorder(
                              side: interval == IntervalChart.day
                                  ? BorderSide(color: sideColor)
                                  : BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: AutoSizeText(
                            LocaleKeys.cryptoAssetScreen_frame1.tr(),
                            style: style)),
                    ElevatedButton(
                        onPressed: () {
                          if (intervalNotifier.value != IntervalChart.week) {
                            intervalNotifier.value = IntervalChart.week;
                            context.read<MarketTokenBloc>().add(GetTokenPrice(
                                Params(
                                    idToken: id,
                                    periode: IntervalChart.week,
                                    currentOfMarket: "usd")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            overlayColor: overlayColor,
                            backgroundColor: backgroundColor,
                            elevation: 0.1,
                            shape: RoundedRectangleBorder(
                              side: interval == IntervalChart.week
                                  ? BorderSide(color: sideColor)
                                  : BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: AutoSizeText(
                            LocaleKeys.cryptoAssetScreen_frame2.tr(),
                            style: style)),
                    ElevatedButton(
                        onPressed: () {
                          if (intervalNotifier.value != IntervalChart.month) {
                            intervalNotifier.value = IntervalChart.month;
                            context.read<MarketTokenBloc>().add(GetTokenPrice(
                                Params(
                                    idToken: id,
                                    periode: IntervalChart.month,
                                    currentOfMarket: "usd")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            overlayColor: overlayColor,
                            backgroundColor: backgroundColor,
                            elevation: 0.1,
                            shape: RoundedRectangleBorder(
                              side: interval == IntervalChart.month
                                  ? BorderSide(color: sideColor)
                                  : BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: AutoSizeText(
                            LocaleKeys.cryptoAssetScreen_frame3.tr(),
                            style: style)),
                    ElevatedButton(
                        onPressed: () {
                          if (intervalNotifier.value != IntervalChart.year) {
                            intervalNotifier.value = IntervalChart.year;
                            context.read<MarketTokenBloc>().add(GetTokenPrice(
                                Params(
                                    idToken: id,
                                    periode: IntervalChart.year,
                                    currentOfMarket: "usd")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            overlayColor: overlayColor,
                            backgroundColor: backgroundColor,
                            elevation: 0.1,
                            shape: RoundedRectangleBorder(
                              side: interval == IntervalChart.year
                                  ? BorderSide(color: sideColor)
                                  : BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: AutoSizeText(
                            LocaleKeys.cryptoAssetScreen_frame4.tr(),
                            style: style))
                  ],
                )));
  }
}
