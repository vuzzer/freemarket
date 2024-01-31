import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/presentation/widget/crypto_asset_widget.dart';
import 'package:defi/presentation/widget/favoris_list_widget.dart';
import 'package:defi/presentation/widget/tx_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class ThetaBodyWidget extends StatelessWidget {
  final List<CryptoInfo> cryptos;
  const ThetaBodyWidget({Key? key, required this.cryptos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();
    return Expanded(
      child: Container(
          width: size.screenWidth,
          decoration: const BoxDecoration(
              color: blue1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
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
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        unselectedLabelColor: greyLight,
                        tabs: const [
                          Tab(
                            child: Text(
                              'Cryptos',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Favoris',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ])),
                Expanded(
                    child: TabBarView(children: [
                  ListView.separated(
                      padding: const EdgeInsets.all(0),
                      itemCount: cryptos.length,
                      separatorBuilder: (context, index) => Container(
                          height: 0.2,
                          width: size.screenWidth,
                          decoration: BoxDecoration(
                            color: greyLight,
                          )),
                      itemBuilder: (context, index) => CryptoAssetWidget(
                            key: ValueKey(cryptos[index].name ),
                            crypto: cryptos[index],
                          )),
                  const FavorisListWidget()
                ]))
              ],
            ),
          )),
    );
  }
}
