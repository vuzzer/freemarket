import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/widget/crypto_asset_widget.dart';
import 'package:defi/presentation/widget/favoris_list_widget.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class ThetaBodyWidget extends StatelessWidget {
  final List<CryptoInfo> cryptos;
  const ThetaBodyWidget({Key? key, required this.cryptos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();
    return BlocBuilder<BrightnessBloc, BrightnessState>(
        builder: (context, state) {
      bool isDarkMode = state.brightness == Mode.dark;
      return Expanded(
        child: Container(
            width: size.screenWidth,
            decoration:  BoxDecoration(
                color: isDarkMode ? blue1 : FontColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                      decoration:  BoxDecoration(
                          border: Border(bottom: BorderSide(color: isDarkMode ? blueLight : greyLight ))),
                      child: TabBar(
                          splashBorderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              indicatorColor: isDarkMode ? FontColor.blue : FontColor.greyLight,
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
                              key: ValueKey(cryptos[index].name),
                              crypto: cryptos[index],
                            )),
                    const FavorisListWidget()
                  ]))
                ],
              ),
            )),
      );
    });
  }
}
