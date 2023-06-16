import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdresseWidget extends StatelessWidget {
  const AdresseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const AutoSizeText("Adresse",
            style: TextStyle(color: Colors.white, fontSize: fontSizeMd)),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: (kSizeUnit * 3.2).w,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Form(
                  child: TextFormField(
                keyboardType: TextInputType.none,
                autocorrect: false,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    labelText: "Entrez l'adresse",
                    suffixIcon: Icon(
                      Icons.account_balance_wallet,
                      color: greyLight,
                    ),
                    labelStyle: TextStyle(color: greyLight),
                    border: InputBorder.none),
              )),
            )),
        const SizedBox(
          height: 15,
        ),
        const AutoSizeText(
          "Réseau",
          style: TextStyle(color: Colors.white, fontSize: fontSizeMd),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            width: (kSizeUnit * 3.2).w,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Form(
                  child: TextFormField(
                keyboardType: TextInputType.none,
                enabled: false,
                autocorrect: false,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    labelText: "Sélectionner un réseau de retrait",
                    labelStyle: TextStyle(color: greyLight),
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: greyLight,
                    ),
                    border: InputBorder.none),
              )),
            )),
      ],
    );
  }
}
