import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class CryptoAssetWidget extends HookWidget {
  final NetworkType network;
  const CryptoAssetWidget({Key? key, required this.network}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final sizes = MediaQuery.of(context);
    final store = useWallet(context);


    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: () {
              logger.d(store.state.network.name);
              //Navigator.of(context).pushNamed(CryptoAssetScreen.routeName);
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
                        style:
                            TextStyle(color: greyLight, fontFamily: roboto))),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //price of token on the market (use chainlink)
                        // TODO: get price of token on the market
                        const AutoSizeText("\$16",
                            style: TextStyle(
                                color: Colors.white, fontFamily: roboto)),
                        //Balance token
                        const SizedBox(
                          height: 8,
                        ),
                        AutoSizeText(
                            "${store.state.ethBalance} ${network.config.symbol}",
                            style: TextStyle(
                                color: greyLight, fontFamily: roboto)),
                      ],
                    )))));
  }
}
