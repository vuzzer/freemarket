import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';

class SwapTokenWidget extends StatelessWidget {
  const SwapTokenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: (kSizeUnit * 3.2).w,
      height: 120,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: blue1, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "From",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              AutoSizeText(
                "Balance : -- BTC",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            children: [
              Flexible(
                  flex: 2,
                  child: Form(
                    child: TextFormField(
                      style: TextStyle(color: greyLight),
                      cursorColor: greyLight,
                      decoration: InputDecoration(
                        hintText: "0.0",
                        hintStyle: TextStyle(color: greyLight),
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: greyLight, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: CircleAvatar(
                        backgroundColor: blueLight,
                        child: Image.asset("assets/cryptos/btc.png"),
                      ),
                    ),
                    Flexible(
                        child: AutoSizeText(
                      "BTC",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    const Flexible(
                        child: Icon(
                      Icons.expand_less,
                      color: Colors.white,
                    ))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
