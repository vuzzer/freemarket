import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/core/params.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/widget/appbar_token_widget.dart';
import 'package:defi/presentation/widget/bottom_titles_widget.dart';
import 'package:defi/presentation/widget/crypto_tx_history_widget.dart';
import 'package:defi/presentation/widget/graph_stock_widget.dart';
import 'package:defi/presentation/widget/nointernet_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

class CryptoAssetScreen extends StatefulWidget {
  static const routeName = "/cryto-asset";
  const CryptoAssetScreen({super.key});

  @override
  State<CryptoAssetScreen> createState() => _CryptoAssetScreenState();
}

class _CryptoAssetScreenState extends State<CryptoAssetScreen> {
  late Timer timer;
  @override
  void initState() {
    CheckConnectivity.checkConnectivity();

    // Refresh data
    timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
      if (await CheckConnectivity.isConnected) {
        refreshData();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    CheckConnectivity.dispose();
    timer.cancel();
    super.dispose();
  }

  void refreshData() {
    sl<CryptosBloc>().add(const UpdateCryptoInfo());
  }

  @override
  Widget build(BuildContext context) {
    // Get crypto passed as argument
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);

    return Scaffold(
        body: StreamBuilder(
            stream: CheckConnectivity.listener,
            builder: (context, snapshot) {
              final status = snapshot.data;
              if (status == InternetConnectionStatus.disconnected) {
                return const NoInternetWiget();
              }
              return BlocProvider<MarketTokenBloc>(
                  create: (context) => sl<MarketTokenBloc>()
                    ..add(GetTokenPrice(
                        Params(idToken: id, currentOfMarket: "usd"))),
                  child: BlocBuilder<CryptosBloc, CryptoState>(
                      builder: (context, state) {
                    if (!state.loading) {
                      // Fetch crypto by its ID(name)
                      final crypto = state.cryptos
                          .where((value) => value.id == id)
                          .toList()[0];

                      // token change indicator
                      final price24h =
                          double.parse(crypto.priceChange24h.toString());

                      return Scaffold(
                          appBar: AppBarTokenWidget(
                              title: crypto.id, crypto: crypto),
                          body: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: darkMode
                                          ? darkBlue
                                          : FontColor.white),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      AutoSizeText(
                                        DateFormat.yMMMd()
                                            .format(DateTime.now()),
                                        style:
                                            const TextStyle(fontFamily: roboto),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          child: AutoSizeText(
                                            "\$${crypto.currentPrice}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            price24h > 0
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: price24h > 0
                                                ? Colors.green
                                                : FontColor.red,
                                            size: 30,
                                          ),
                                          AutoSizeText(
                                            crypto.priceChange24h!
                                                .toStringAsFixed(2),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: roboto,
                                                color: price24h > 0
                                                    ? Colors.green
                                                    : FontColor.red),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),

                                //Chart
                                const GraphStockWidget(),
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: darkMode
                                          ? darkBlue
                                          : FontColor.white),
                                ),
                                BottomTitlesWidget(id: id),
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: darkMode
                                          ? darkBlue
                                          : FontColor.white),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: darkMode
                                            ? darkBlue
                                            : FontColor.white),
                                    child:
                                        CryptoTxHistoryWidget(crypto: crypto))
                              ],
                            ),
                          ));
                    }
                    return const Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }));
            }));
  }
}
