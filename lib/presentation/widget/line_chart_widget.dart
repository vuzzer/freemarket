import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/params.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const AutoSizeText('Day', style: style));
        break;
      case 5:
        text = Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const Text('Week', style: style));
        break;
      case 8:
        text = Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const Text('Month', style: style));
        break;
      case 10:
        text = Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const Text('Year', style: style));
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [blue, darkBlue];

    return BlocBuilder<MarketTokenBloc, MarketTokenState>(
        builder: (context, state) {
      // Return Token Market Chart
      if (state is MarketTokenLoaded) {
        return LineChart(LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: false,
            horizontalInterval: 1,
            verticalInterval: 1,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
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
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
                interval: 1,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          minX: state.tokenMarketData.times.first.toDouble(),
          maxX: state.tokenMarketData.times.last.toDouble()+3000.0,
          minY: state.tokenMarketData.prices.reduce(min),
          maxY: state.tokenMarketData.prices.reduce(max),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                  state.tokenMarketData.prices.length,
                  (p) => FlSpot(
                      double.parse(state.tokenMarketData.times[p].toString()),
                      state.tokenMarketData.prices[p])),
              isCurved: false,
              barWidth: 1.6,
              isStrokeCapRound: true,
              dotData: FlDotData(
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
      }
       else {
        return const SizedBox.shrink();
      }
    });
  }
}
