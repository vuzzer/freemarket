import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/styles/font_family.dart';
import 'package:defi/styles/media_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBalance extends StatefulWidget {
  const CardBalance({super.key});

  @override
  State<CardBalance> createState() => _CardBalanceState();
}

class _CardBalanceState extends State<CardBalance> {
  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    BoxDecoration decoration;
    if (darkMode) {
      decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Color(0XFFA460ED),
            Color(0XFF19A5D1),
          ], stops: [
            0.4,
            1
          ], begin: Alignment.topLeft, end: Alignment.bottomRight));
    } else {
      decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white);
    }

    return Container(
        width: Media.width,
        height: Media.height,
        padding: const EdgeInsets.only(left: 30),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: decoration,
        child: BlocBuilder<PrimaryCryptoBloc, PrimaryCryptoState>(
          builder: (context, state) {
            if (!state.loading) {
              final price24h =
                  double.tryParse(state.crypto!.priceChange24h.toString());
              final currentPrice =
                  double.tryParse(state.crypto!.currentPrice.toString());

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Media.topSpace,
                  AutoSizeText(
                    "${state.crypto?.name}",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontSize: Media.headline2,
                        fontFamily: FontFamily.montSerrat),
                  ),
                  Media.middleSpace,
                  TweenAnimationBuilder(
                      tween: Tween<double>(begin: 68000, end: currentPrice),
                      duration: const Duration(seconds: 2),
                      builder: (context, double value, child) => AutoSizeText(
                            "\$${value.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color,
                                fontSize: Media.headline1,
                                fontFamily: FontFamily.montSerrat),
                          )),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      price24h != null
                          ? Icon(
                              price24h > 0
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: price24h > 0 ? Colors.green : Colors.red,
                              size: 30,
                            )
                          : const SizedBox.shrink(),
                      AutoSizeText(
                        "${state.crypto?.priceChange24h?.toStringAsFixed(2)}%",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline6!.color,
                          fontSize: Media.headline3,
                          fontFamily: FontFamily.montSerrat,
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
            return const Center(
                child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ));
          },
        ));
  }
}
