import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/presentation/screens/tx_info_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_font.dart';

class TxWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Color color;
  const TxWidget(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: () =>
                Navigator.of(context).pushNamed(TxInfoScreen.routeName),
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: blueLight,
                    radius: 30,
                    child: Icon(
                      iconData,
                      color: color,
                    ),
                  ),
                ),
                title: AutoSizeText(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AutoSizeText("from: kalidge",
                        style:
                            TextStyle(color: greyLight, fontFamily: roboto))),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const AutoSizeText("0.0003 BTC",
                            style: TextStyle(
                                color: Colors.white, fontFamily: roboto)),
                        const SizedBox(
                          height: 8,
                        ),
                        AutoSizeText("\$16",
                            style: TextStyle(
                                color: greyLight, fontFamily: roboto)),
                      ],
                    )))));
  }
}
