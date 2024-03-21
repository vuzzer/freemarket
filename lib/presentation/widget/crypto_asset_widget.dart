import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoAssetWidget extends StatelessWidget {
  final CryptoInfo crypto;
  const CryptoAssetWidget({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final sizes = MediaQuery.of(context);
    final price24h = double.tryParse(crypto.priceChange24h.toString());
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: darkMode ? blueLight : greyLight , 
            highlightColor: darkMode ? blueLight : greyLight,
            onTap: () {
              // Route to Chart Screen
              Navigator.of(context)
                  .pushNamed(CryptoAssetScreen.routeName, arguments: crypto.id);
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
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: price24h != null
                        ? AutoSizeText(price24h.toStringAsFixed(2),
                            style: TextStyle(
                              color:
                                  price24h > 0.0 ? Colors.green : FontColor.red,
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
                            style: Theme.of(context).textTheme.bodySmall),
                        //Balance token
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )))));
  }
}
