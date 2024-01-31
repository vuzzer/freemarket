import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/params.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../blocs/market/market_token_bloc.dart';

var logger = Logger();

class CryptoAssetWidget extends StatelessWidget {
  final CryptoInfo crypto;
  const CryptoAssetWidget({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final sizes = MediaQuery.of(context);
    final price24h = double.tryParse(crypto.priceChange24h.toString());
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: () {
              //logger.d(store.state.network.name);
              context.read<MarketTokenBloc>().add(GetTokenPrice(
                  Params(idToken: crypto.id, currentOfMarket: "usd")));

              // Route to Chart Screen
              Navigator.of(context).pushNamed(CryptoAssetScreen.routeName, arguments: crypto );
            },
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(crypto.image),
                  ),
                ),
                title: AutoSizeText(
                  crypto.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: price24h != null
                        ? AutoSizeText(price24h.toStringAsFixed(2),
                            style: TextStyle(
                              color: price24h > 0.0 ? Colors.green : Colors.red,
                              fontFamily: roboto,
                            ))
                        : const SizedBox.shrink()),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //price of token on the market (use chainlink)
                        AutoSizeText("\$${crypto.currentPrice}",
                            style: const TextStyle(
                                color: Colors.white, fontFamily: roboto)),
                        //Balance token
                        const SizedBox(
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
