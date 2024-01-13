import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/params.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/presentation/blocs/client/client_profil_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../blocs/market/market_token_bloc.dart';

var logger = Logger();

class CryptoAssetWidget extends StatelessWidget {
  final NetworkType network;
  const CryptoAssetWidget({Key? key, required this.network}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final sizes = MediaQuery.of(context);
    return Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: blueLight,
                highlightColor: blueLight,
                onTap: () {
                  //logger.d(store.state.network.name);
                   BlocProvider.of<MarketTokenBloc>(context).add(const GetTokenPrice(Params(idToken: "ethereum", currentOfMarket: "usd")) );
                  Navigator.of(context).pushNamed(CryptoAssetScreen.routeName);
                },
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 30,
                        child: Image.asset(
                            "assets/cryptos/${network.config.icon}.png"),
                      ),
                    ),
                    title: AutoSizeText(
                      network.config.label,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: AutoSizeText("\$21000",
                            style: TextStyle(
                                color: greyLight, fontFamily: roboto))),
                    trailing: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //price of token on the market (use chainlink)
                             AutoSizeText("\$16",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: roboto)),
                            //Balance token
                             SizedBox(
                              height: 8,
                            ),
                            //ANALYZING ARCHITECTURE WALLET
                            /*  AutoSizeText(
                                "${EthAmountFormatter(value.states.wallets[network]!.tokenBalance).format()} ${network.config.symbol}",
                                style: TextStyle(
                                    color: greyLight, fontFamily: roboto)), */
                          ],
                        )))));
  }
}
