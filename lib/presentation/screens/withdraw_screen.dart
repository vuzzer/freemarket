import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/withdraw/withdraw_crypto_fiat.dart';
import 'package:defi/presentation/widget/withdraw/withdraw_crypto_widget.dart';
import 'package:flutter/material.dart';

class WithDrawScreen extends StatelessWidget {
  static const routeName = "/withdraw";
  const WithDrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Retrait "),
      body: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: blueLight))),
                child: TabBar(
                    splashBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 15),
                    unselectedLabelColor: greyLight,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Crypto',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Fiat',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ])),
            const Expanded(
                child: TabBarView(
                    children: [WithDrawCryptoWidget(), WithDrawCryptoFiat()]))
          ],
        ),
      )),
    );
  }
}
