import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class StartedScreen extends StatefulWidget {
  static const routeName = "/";
  const StartedScreen({Key? key}) : super(key: key);

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  final internetCheckerStream = sl<NetworkInfo>().listener;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                          /* SizedBox(
                    height: 450,
                    child: Stack(
                      children: [
                       
                        Positioned(
                            top: 190,
                            left: 20,
                            height: 220,
                            width: 380,
                            child: Transform.rotate(
                                angle: -2.03 * pi,
                                child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CreditCardWidget()))),
                        Transform.rotate(
                            angle: 2.09 * pi,
                            child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: CreditCardWidget())),
                                 Lottie.asset(
                          "assets/bitcoin.json",
                          height: 200,
                          width: 2000,
                        ),
                      ],
                    )), */
                          const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Manage your',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'crypto assets',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'simply',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Get Crpypto lists
                                    context
                                        .read<CryptosBloc>()
                                        .add(GetCryptoInfo());

                                    Navigator.of(context)
                                        .pushNamed(ThetaScreen.routeName);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 70, vertical: 18),
                                      backgroundColor: const Color(0XFF19A5D1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )))
                        ],
                      ),
                    ))
          
            );
  }
}
