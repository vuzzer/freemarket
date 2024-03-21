import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/widget/display_notification_setup.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CryptoTxHistoryWidget extends StatelessWidget {
  final CryptoInfo crypto;
  const CryptoTxHistoryWidget({Key? key, required this.crypto})
      : super(key: key);
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
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed euismod nisi porta lorem mollis aliquam ut porttitor leo.",
                    style: TextStyle(color: darkMode ? Colors.grey.withOpacity(0.6) : FontColor.black ),
                    textAlign: TextAlign.start,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Label for detail crypto
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Price",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("24 High",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("24h Low",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("Market Cap Rank",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("Market Cap",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("Circulating Supply",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("Total Supply",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("All-Time High",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                      SizedBox(
                        height: space,
                      ),
                      Text("All-Time Low",
                          style: TextStyle(
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontFamily:
                                theme.textTheme.displayMedium!.fontFamily,
                            color: theme.textTheme.displayMedium!.color,
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$ 897",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        "\$ 890",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        "\$ 89",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text("7M",
                          style: TextStyle(
                              fontFamily: FontFamily.robotoCondensedBold,
                              fontSize: theme.textTheme.displayMedium!.fontSize,
                              fontWeight: FontWeight.w900,
                              color: color)),
                      Text(
                        "19.7K",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        "20K",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        "19.7K",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
                            fontSize: theme.textTheme.displayMedium!.fontSize,
                            fontWeight: FontWeight.w900,
                            color: color),
                      ),
                      SizedBox(
                        height: space,
                      ),
                      Text(
                        "20K",
                        style: TextStyle(
                            fontFamily: FontFamily.robotoCondensedBold,
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
