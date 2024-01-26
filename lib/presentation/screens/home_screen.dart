import 'package:defi/core/network/network_info.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/screens/deposit_screen.dart';
import 'package:defi/presentation/screens/send_screen.dart';
import 'package:defi/presentation/screens/withdraw_screen.dart';
import 'package:defi/presentation/widget/button_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../helpers/crypto_symbols.dart';
import '../widget/card_balance.dart';
import '../widget/theta_body_widget.dart';
import 'choose_currency_screen.dart';

class HomeScreen extends StatefulWidget {
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
              return  Scaffold(
        body: BlocBuilder<CryptosBloc, CryptosState>(builder: (context, state) {
      if (state is CryptosLoaded) {
      return Column(
        children: [
          SizedBox(
            height: (kFontSizeUnit * 5).h,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonOperation(
                icon: Icons.arrow_upward,
                text: "Envoyer",
                onPressed: () =>
                    Navigator.of(context).pushNamed(SendScreen.routeName),
              ),
              ButtonOperation(
                icon: Icons.arrow_downward,
                text: "Recevoir",
                onPressed: () => Navigator.of(context).pushNamed(
                  ChooseCurrencyScreen.routeName,
                ),
              ),
              ButtonOperation(
                icon: Icons.payment,
                text: "Acheter",
                onPressed: () {
                  Navigator.of(context).pushNamed(DepositScreen.routeName);
                },
              ),
              ButtonOperation(
                icon: Icons.paid,
                text: "Retrait",
                onPressed: () {
                  Navigator.of(context).pushNamed(WithDrawScreen.routeName);
                },
              ),
            ],
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

    }));}));
  }
}
