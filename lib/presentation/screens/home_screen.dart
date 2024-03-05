import 'dart:async';

import 'package:defi/core/background_service.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import '../../helpers/crypto_symbols.dart';
import '../widget/card_balance.dart';
import '../widget/theta_body_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer timer;
  @override
  void initState() {
    CheckConnectivity.checkConnectivity();
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      refreshData();
    });
  }

  @override
  void dispose() {
    CheckConnectivity.dispose();
    timer.cancel();
    super.dispose();
  }

  void refreshData() {
    sl<CryptosBloc>().add(GetCryptoInfo());
  }

  @override
  Widget build(BuildContext context) {
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
              return Scaffold(body: BlocBuilder<CryptosBloc, CryptoState>(
                  builder: (context, state) {
                if (!state.loading) {
                  // Transfer list of token data to background task
                  //Logger().d(state.cryptos);
                  final cryptoData = state.cryptos
                      .map(
                          (data) => {'id': data.id, 'price': data.currentPrice})
                      .toList();
                  FlutterBackgroundService().invoke(
                      BackgroundService.notificationEvent,
                      {'tokens': cryptoData});

                  // Primary Crypto to display on card
                  context
                      .read<PrimaryCryptoBloc>()
                      .add(const PrimaryCryptoEvent.getPrimaryCrypto());

                  // Load favoris crypto of users
                  context.read<FavorisBloc>().add(LoadFavorisEvent());

                  return Column(
                    children: [
                      SizedBox(
                        height: (kFontSizeUnit * 5).h,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              // Icons.dark_mode
                              Icon(
                                Icons.light_mode,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const CardBalance(),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ThetaBodyWidget(cryptos: state.cryptos)
                    ],
                  );
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
              }));
            }));
  }
}
