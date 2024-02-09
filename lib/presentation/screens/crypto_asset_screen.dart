import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/market/market_token_bloc.dart';
import 'package:defi/presentation/widget/appbar_token_widget.dart';
import 'package:defi/presentation/widget/bottom_titles_widget.dart';
import 'package:defi/presentation/widget/crypto_tx_history_widget.dart';
import 'package:defi/presentation/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CryptoAssetScreen extends StatefulWidget {
  static const routeName = "/cryto-asset";
  const CryptoAssetScreen({Key? key}) : super(key: key);

  @override
  State<CryptoAssetScreen> createState() => _CryptoAssetScreenState();
}

class _CryptoAssetScreenState extends State<CryptoAssetScreen> {
  @override
  void initState() {
    CheckConnectivity.checkConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    CheckConnectivity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get crypto passed as argument
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        body: StreamBuilder(
            stream: CheckConnectivity.listener,
            builder: (context, snapshot) {
              final status = snapshot.data;
              if (status == InternetConnectionStatus.disconnected) {
                return Center(
                    child: Text(
                  "Pas de connexion internet",
                  style: Theme.of(context).textTheme.displayMedium,
                ));
              }
              return BlocBuilder<CryptosBloc, CryptoState>(
                  builder: (context, state) {
                if (!state.loading) {
                  // Fetch crypto by its ID(name)
                  final crypto = state.cryptos
                      .where((value) => value.id == id)
                      .toList()[0];
                  return Scaffold(
                      backgroundColor: blue1,
                      appBar:
                          AppBarTokenWidget(title: crypto.id, crypto: crypto),
                      body: SafeArea(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(color: darkBlue),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AutoSizeText(
                                    DateFormat.yMMMd().format(DateTime.now()),
                                    style: const TextStyle(fontFamily: roboto),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      child: AutoSizeText(
                                        "\$ ${crypto.currentPrice}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.redAccent,
                                        size: 30,
                                      ),
                                      BlocConsumer<MarketTokenBloc,
                                              MarketTokenState>(
                                          builder: (context, state) {
                                            return const AutoSizeText(
                                              "\$ 13.54 (1.23%)",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: roboto,
                                                  color: Colors.redAccent),
                                            );
                                          },
                                          listener: (context, state) {})
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),

                            //Chart
                            const LineChartWidget(),
                            Container(
                              height: 8,
                              decoration: const BoxDecoration(color: darkBlue),
                            ),
                            const BottomTitlesWidget(),
                            Container(
                              height: 10,
                              decoration: const BoxDecoration(color: darkBlue),
                            ),
                            Container(
                                decoration:
                                    const BoxDecoration(color: darkBlue),
                                child: const CryptoTxHistoryWidget())
                          ],
                        ),
                      )));
                }
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              });
            }));
  }
}
