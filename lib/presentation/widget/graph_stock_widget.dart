import 'dart:math';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/styles/font_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GraphStockWidget extends StatelessWidget {
  const GraphStockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    List<Color> gradientColors =
        darkMode ? [blue, darkBlue] : [FontColor.white1, FontColor.white];
    final size = ScreenUtil();
    return Container(
        width: size.screenWidth,
        height: 200,
        decoration: BoxDecoration(color: darkMode ? darkBlue : FontColor.white),
        child: BlocBuilder<MarketTokenBloc, MarketTokenState>(
            builder: (context, state) {
          // Return Token Market Chart
          if (!state.loading) {
            if (state.successOrFailure.isLeft()) {
              return LayoutBuilder(
                builder: (context, constraint) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      width: constraint.maxWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: FontColor.greyLight),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Center(
                          child: Text( LocaleKeys.cryptoAssetScreen_networkErrorMsg.tr(), textAlign: TextAlign.center, )));
                },
              );
            }
            var sum = state.tokenMarketData!.prices.reduce((a, b) => a + b);
            sum = sum / state.tokenMarketData!.prices.length;

            return LineChart(LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                drawHorizontalLine: false,
                horizontalInterval: 1,
                verticalInterval: 1,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Color(0xff37434d),
                    strokeWidth: 1,
                  );
                },
                getDrawingVerticalLine: (value) {
                  return const FlLine(
                    color: Color(0xff37434d),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: const FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 20,
                    interval: 1,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    interval: 1,
                    reservedSize: 42,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              minX: state.tokenMarketData!.times.first.toDouble(),
              maxX: state.tokenMarketData!.times.last.toDouble(),
              minY: sum <= 1 ? 0 : state.tokenMarketData!.prices.reduce(min),
              maxY: state.tokenMarketData!.prices.reduce(max),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                      state.tokenMarketData!.prices.length,
                      (p) => FlSpot(
                          double.parse(
                              state.tokenMarketData!.times[p].toString()),
                          state.tokenMarketData!.prices[p])),
                  isCurved: false,
                  barWidth: 1.6,
                  color: darkMode ? blue : FontColor.black,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.3))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ));
          } else {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        }));
  }
}
