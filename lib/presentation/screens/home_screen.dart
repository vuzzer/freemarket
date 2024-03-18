import 'dart:async';
import 'package:defi/core/background/background_service.dart';
import 'package:defi/core/background/background_task.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/presentation/screens/notification_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  ValueNotifier<int> activeNotificationNotifier = ValueNotifier(0);
  FlutterBackgroundService flutterBackgroundService =
      FlutterBackgroundService();
  @override
  void initState() {
    CheckConnectivity.checkConnectivity();
    Hive.openBox(HiveBoxName.countNotificationBox);

    //BackgroundTask.clearBoxNotification();

    // Background check notification
    flutterBackgroundService
        .invoke(BackgroundService.notificationEvent, {'tokens': []});

    timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
      if (await CheckConnectivity.isConnected) {
        refreshData();
      }
    });

    flutterBackgroundService.on('count').listen((event) {
      activeNotificationNotifier.value = event!['count'];
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
    final cryptoData = sl<CryptosBloc>()
        .state
        .cryptos
        .map((data) => {'id': data.id, 'price': data.currentPrice})
        .toList();

    // background check notification
    flutterBackgroundService
        .invoke(BackgroundService.notificationEvent, {'tokens': cryptoData});
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
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Stack(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          NotificationScreen.routeName);
                                    },
                                    splashRadius: 20,
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 12,
                                ),
                                // Icons.dark_mode
                                const Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                            // Display notification create but not read
                            ValueListenableBuilder(
                              valueListenable: activeNotificationNotifier,
                              builder: (context, value, child) {
                                int countNotification =
                                    activeNotificationNotifier.value;
                                return countNotification > 0
                                    ? Positioned(
                                        bottom: 19,
                                        right: 35,
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  NotificationScreen.routeName);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2),
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: FontColor.red),
                                              child: Align(
                                                  child: Text(
                                                '$countNotification',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        FontFamily.raleway,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            )))
                                    : const SizedBox.shrink();
                              },
                            )
                          ])),
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
