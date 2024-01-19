import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CryptoTxHistoryWidget extends StatelessWidget {
  const CryptoTxHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();
    final theme = Theme.of(context);
    return Container(
        width: size.screenWidth,
        decoration: const BoxDecoration(
            color: blue1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed euismod nisi porta lorem mollis aliquam ut porttitor leo.",
            style: theme.textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Label for detail crypto
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Price",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("24 High",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("24h Low",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("Market Cap Rank",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("Market Cap",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("Circulating Supply",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("Total Supply",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("All-Time High",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
                        color: theme.textTheme.displayMedium!.color,
                      )),
                  Text("All-Time Low",
                      style: TextStyle(
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontFamily: theme.textTheme.displayMedium!.fontFamily,
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
                        color: Colors.white),
                  ),
                  Text(
                    "\$ 890",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "\$ 89",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "3",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text("7M",
                      style: TextStyle(
                          fontFamily: FontFamily.robotoCondensedBold,
                          fontSize: theme.textTheme.displayMedium!.fontSize,
                          fontWeight: FontWeight.w900,
                          color: Colors.white)),
                  Text(
                    "19.7K",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "20K",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "19.7K",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Text(
                    "20K",
                    style: TextStyle(
                        fontFamily: FontFamily.robotoCondensedBold,
                        fontSize: theme.textTheme.displayMedium!.fontSize,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ],
              )
            ],
          )
        ]));
  }
}
