import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 220,
        padding: const EdgeInsets.only(left: 30),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              Color(0XFFA460ED),
              Color(0XFF19A5D1),
            ], stops: [
              0.4,
              1
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: BlocBuilder<PrimaryCryptoBloc, PrimaryCryptoState>(
          builder: (context, state) {
            if (!state.loading) {
              final price24h =
                  double.tryParse(state.crypto!.priceChange24h.toString());
              final currentPrice = double.tryParse(state.crypto!.currentPrice.toString());

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  AutoSizeText(
                    "${state.crypto?.name}",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline6!.color,
                        fontSize:
                            Theme.of(context).textTheme.headline6!.fontSize,
                        fontFamily: FontFamily.montSerrat),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TweenAnimationBuilder(tween: Tween<double>(begin: 0, end: currentPrice ), duration: const Duration(seconds: 2), builder: (context, double value, child) =>
                  AutoSizeText(
                    "\$${value.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color,
                        fontSize:
                            Theme.of(context).textTheme.headline3!.fontSize,
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
                          fontSize:
                              Theme.of(context).textTheme.headline6!.fontSize,
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
