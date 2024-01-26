import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/network/network_info.dart';
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
    final size = ScreenUtil();
    return Scaffold(
      body: StreamBuilder(
            stream: CheckConnectivity.listener,
            builder: (context, snapshot) {
              final status = snapshot.data;
              if(status == InternetConnectionStatus.disconnected){
                return Center(
                  child: Text(
                "Pas de connexion internet",
                style: Theme.of(context).textTheme.displayMedium,
              ));
              }
              return Scaffold(
        backgroundColor: blue1,
        appBar: const AppBarTokenWidget(title: "Ethereum"),
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
                    BlocConsumer<MarketTokenBloc, MarketTokenState>(
                        builder: (context, state) {
                          if (state is MarketTokenLoaded) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: AutoSizeText(
                                  "\$ ${state.tokenMarketData.prices.last}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                        listener: (context, state) {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.redAccent,
                          size: 30,
                        ),
                        BlocConsumer<MarketTokenBloc, MarketTokenState>(
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
              Container(
                  width: size.screenWidth,
                  height: 200,
                  decoration: const BoxDecoration(color: darkBlue),
                  child: BlocBuilder<MarketTokenBloc, MarketTokenState>(
                      builder: (context, state) {
                    if (state is MarketTokenEmpty) {
                      return const Center(child: Text("Aucune donnée"));
                    } else if (state is MarketTokenLoading) {
                      context.loaderOverlay.show();
                      return const SizedBox.shrink();
                    } else if (state is MarketTokenLoaded) {
                      context.loaderOverlay.hide();
                      return const LineChartWidget();
                    } else if (state is MarketTokenError) {
                      context.loaderOverlay.hide();
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox.shrink();
                    }
                  })),
              Container(height: 8, decoration: const BoxDecoration(color: darkBlue),),
              const BottomTitlesWidget(),
               Container(
                height: 10,
                decoration: const BoxDecoration(color: darkBlue),
              ),
              Container(
          
                decoration: const BoxDecoration(color: darkBlue), child: const CryptoTxHistoryWidget())
            ],
          ),
        )));}));
  }
}
