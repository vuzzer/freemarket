import 'package:defi/core/network/network_info.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/screens/home_screen.dart';
import 'package:defi/presentation/widget/adaptive_dialog.dart';
import 'package:defi/service_locator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class StartedScreen extends StatefulWidget {
  static const routeName = "/";
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  void initState() {
    CheckConnectivity.checkConnectivity();

    sl<SetupNotification>().permissionNotification().then((isAllowed) {
      if (!isAllowed) {
        adaptiveDialog(context);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    CheckConnectivity.dispose();
    super.dispose();
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
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Color(0XFF171B2F),
                        Color(0XFFA460ED),
                        Color(0XFF19A5D1),
                        Color(0XFFA460ED),
                        Color(0XFF171B2F)
                      ],
                          stops: [
                        0.03,
                        0.35,
                        0.5,
                        0.7,
                        1
                      ],
                          //transform: GradientRotation(5),
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(
                          height: 2,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                LocaleKeys.startScreen_helloMsg1,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                              const Text(
                                LocaleKeys.startScreen_helloMsg2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                              const Text(
                                LocaleKeys.startScreen_helloMsg3,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                            ]),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Get Crpypto lists
                                  context
                                      .read<CryptosBloc>()
                                      .add(const GetCryptoInfo());

                                  Navigator.of(context)
                                      .pushNamed(HomeScreen.routeName);
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 18),
                                    backgroundColor: const Color(0XFF19A5D1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text(
                                  LocaleKeys.startScreen_button,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ).tr()))
                      ],
                    ),
                  ));
            }));
  }
}
