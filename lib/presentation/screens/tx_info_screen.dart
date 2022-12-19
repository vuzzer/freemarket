import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_icon_widget.dart';
import 'package:flutter/material.dart';

class TxInfoScreen extends StatelessWidget {
  static const routeName = "/tx-info";
  const TxInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const AppBarWidget(title: "Send",),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const AutoSizeText("\$ 50,123.34"),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Image.asset("assets/cryptos/eth.png"),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  AutoSizeText(
                    "13.54",
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              )),
          Container(
            width: 140,
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.withOpacity(0.13)),
            child: const AutoSizeText(
              "Success",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: 400,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText(
                      "Date",
                      style:
                          TextStyle(color: Colors.white, fontSize: fontSizeMd),
                    ),
                    AutoSizeText("Nov 12, 2022",
                        style:
                            TextStyle(color: greyLight, fontSize: fontSizeMd))
                  ],
                ),
                Divider(
                  color: greyLight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText("Recipient",
                        style: TextStyle(
                            color: Colors.white, fontSize: fontSizeMd)),
                    AutoSizeText("0x1kadn...7ee ",
                        style:
                            TextStyle(color: greyLight, fontSize: fontSizeMd))
                  ],
                ),
                Divider(
                  color: greyLight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText("Net fee",
                        style: TextStyle(
                            color: Colors.white, fontSize: fontSizeMd)),
                    AutoSizeText("\$54.00",
                        style:
                            TextStyle(color: greyLight, fontSize: fontSizeMd))
                  ],
                ),
               
              ],
            ),
          ),
          const SizedBox(height: 20,),
          ButtonIconWidget(iconData: Icons.replay, label: "Repeat", raduis: 10, onPressed: (() {
           
         }),)
        ],
      ),
    );
  }
}
