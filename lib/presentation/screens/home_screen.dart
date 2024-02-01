import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
