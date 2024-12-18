import 'package:defi/helpers/crypto_symbols.dart';
import 'package:defi/presentation/widget/card_balance.dart';
import 'package:defi/presentation/widget/theta_body_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:defi/core/background/background_service.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/blocs/active-notification/active_notification_bloc.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/linkStore/link_store_bloc.dart';
import 'package:defi/presentation/screens/notification_screen.dart';
import 'package:defi/presentation/widget/nointernet_widget.dart';
import 'package:defi/presentation/widget/reloading_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:share_plus/share_plus.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  late Timer timer;
  ValueNotifier<int> activeNotificationNotifier = ValueNotifier(0);
  FlutterBackgroundService flutterBackgroundService =
      FlutterBackgroundService();

  @override
  void initState() {
    CheckConnectivity.checkConnectivity();
    Hive.openBox(HiveBoxName.countNotificationBox);

    // No data available for notification at initialization
    flutterBackgroundService
        .invoke(BackgroundService.notificationEvent, {'tokens': []});

    // Background check notification every 1min
    timer = Timer.periodic(const Duration(seconds: 60), (timer) async {
      if (await CheckConnectivity.isConnected) {
        refreshData();
      }
    });

    // Count number of notification active
    flutterBackgroundService.on('count').listen((event) {
      sl<ActiveNotificationBloc>()
          .add(UpdateActiveNotification(event!['count']));
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
              return Scaffold(
                  backgroundColor:
                      darkMode ? FontColor.darkBlue : FontColor.white1,
                  body: BlocBuilder<CryptosBloc, CryptoState>(
                      builder: (context, state) {
                    if (!state.loading) {
                      if (state.successOrFailure.isLeft()) {
                        return const ReloadingWidget();
                      }

                      // LinkToShare
                      sl<LinkStoreBloc>().add(const GetLinkStoreToShare());

                      return Column(
                        children: [
                          SizedBox(
                            height: (kFontSizeUnit * 5).h,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Stack(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BlocBuilder<LinkStoreBloc, LinkStoreState>(
                                      builder: (context, state) {
                                        return IconButton(
                                            onPressed: () async {
                                              if (state.successOrFailure
                                                  .isRight()) {
                                                await Share.shareUri(
                                                    Uri.parse(state.link));
                                              }
                                            },
                                            splashRadius: 20,
                                            padding: EdgeInsets.zero,
                                            icon: const Icon(Icons.share));
                                      },
                                    ),
                                    const Spacer(),
                                    BlocBuilder<BrightnessBloc,
                                            BrightnessState>(
                                        builder: (context, state) {
                                      final darkMode =
                                          state.brightness == Mode.dark;
                                      return IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                                NotificationScreen.routeName);
                                          },
                                          splashRadius: 20,
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            darkMode
                                                ? Icons.notifications
                                                : Icons.notifications_outlined,
                                          ));
                                    }),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    // Icons.dark_mode
                                    BlocBuilder<BrightnessBloc,
                                            BrightnessState>(
                                        builder: (context, state) {
                                      final brightness = state.brightness;
                                      return IconButton(
                                          onPressed: () {
                                            context.read<BrightnessBloc>().add(
                                                const BrightnessEvent
                                                    .changeBrightness());
                                          },
                                          splashRadius: 20,
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            brightness == Mode.dark
                                                ? Icons.light_mode
                                                : Icons.dark_mode_outlined,
                                            size: 30,
                                          ));
                                    })
                                  ],
                                ),
                                // Display notification create but not read
                                BlocBuilder<ActiveNotificationBloc,
                                        ActiveNotificationState>(
                                    builder: (context, state) {
                                  int countNotification =
                                      state.activeNotification;
                                  return countNotification > 0
                                      ? Positioned(
                                          bottom: 19,
                                          right: 55,
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                    NotificationScreen
                                                        .routeName);
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2),
                                                width: 30,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
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
                                })
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
            }),
             );
  }
}