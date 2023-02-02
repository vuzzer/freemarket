import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/wallet/wallet_handler.dart';
import 'package:defi/domain/wallet/wallet_action.dart';
import 'package:defi/presentation/context_provider.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/utils/eth_amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class CryptoAssetWidget extends StatelessWidget {
  final NetworkType network;
  const CryptoAssetWidget({Key? key, required this.network}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final sizes = MediaQuery.of(context);
    return ContextProviderWidget<WalletHandler>(
        onModelReady: (wallet) async {
          wallet.listenTransfers(wallet.states.address, NetworkType.Ethereum);
        },
        builder: (context, value, child) => Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: blueLight,
                highlightColor: blueLight,
                onTap: () {
                  //logger.d(store.state.network.name);
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
                                "${EthAmountFormatter(value.states.wallets[network]!.tokenBalance).format()} ${network.config.symbol}",
                                style: TextStyle(
                                    color: greyLight, fontFamily: roboto)),
                          ],
                        ))))));
  }
}
