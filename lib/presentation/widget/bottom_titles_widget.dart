import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/styles/font_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';

class BottomTitlesWidget extends StatelessWidget {
  const BottomTitlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);

    final decoration = BoxDecoration(
        color: darkMode ? blue1 : FontColor.white1,
        borderRadius: BorderRadius.circular(30));

    final style = TextStyle(
      color: darkMode ? const Color(0xff68737d) : FontColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return Container(
        decoration: BoxDecoration(color: darkMode ? darkBlue : FontColor.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: decoration,
                child: AutoSizeText(LocaleKeys.cryptoAssetScreen_frame1.tr() , style: style ) ),
            Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: decoration,
                child: AutoSizeText(LocaleKeys.cryptoAssetScreen_frame2.tr(), style: style)),
            Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: decoration,
                child: AutoSizeText(LocaleKeys.cryptoAssetScreen_frame3.tr(), style: style)),
            Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: decoration,
                child: AutoSizeText(LocaleKeys.cryptoAssetScreen_frame4.tr(), style: style))
          ],
        ));
  }
}
