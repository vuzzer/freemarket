import 'package:defi/core/enum.dart';
import 'package:defi/core/utils_process.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/widget/display_notification_setup.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CryptoTxHistoryWidget extends StatelessWidget {
  final CryptoInfo crypto;
  const CryptoTxHistoryWidget({super.key, required this.crypto});
  final space = 4.0;

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();
    final theme = Theme.of(context);
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    final color = darkMode ? Colors.white : FontColor.black;
    return Container(
        width: size.screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: darkMode ? blue1 : FontColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    LocaleKeys.cryptoAssetScreen_msg,
                    style: TextStyle(
                        color: darkMode
                            ? Colors.grey.withOpacity(0.6)
                            : FontColor.black),
                    textAlign: TextAlign.start,
                  ).tr()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Label for detail crypto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(LocaleKeys.cryptoAssetScreen_price.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_24high.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_24low.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_rank.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_marketCap.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_supply.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_totalSupply.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_allTimeHigh.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text(LocaleKeys.cryptoAssetScreen_allTimeLow.tr(),
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        formatNumber(crypto.currentPrice as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        formatNumber(crypto.allTimeHigh24h as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        formatNumber(crypto.allTimeLow24h as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        '${crypto.marketCapRank}',
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(formatNumber(crypto.marketCap as num),
                          style: TextStyle(
                              fontFamily: FontFamily.robotoCondensedItalic,
                              fontSize: theme.textTheme.displayMedium!.fontSize,
                              fontWeight: FontWeight.w900,
                              color: color)),
                      Text(
                        formatNumber(crypto.circulatingSupply as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        formatNumber(crypto.totalSupply as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        formatNumber(crypto.allTimeHigh as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        formatNumber(crypto.allTimeLow as num),
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedItalic,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      )
                    ],
                  )
                ],
              ),
              DisplayNotificationSetup(
                crypto: crypto,
              )
            ]));
  }
}
