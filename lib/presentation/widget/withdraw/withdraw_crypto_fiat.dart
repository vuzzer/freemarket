import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:defi/helpers/enum.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithDrawCryptoFiat extends StatefulWidget {
  const WithDrawCryptoFiat({super.key});

  @override
  State<WithDrawCryptoFiat> createState() => _WithDrawCryptoFiatState();
}

class _WithDrawCryptoFiatState extends State<WithDrawCryptoFiat> {
  PaymentType radio = PaymentType.initial;
  //final networks = NetworkType.enabledValues;
  void _update(PaymentType value) {
    radio = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const AutoSizeText(
              "Sélectionner une crypto",
              style: TextStyle(color: Colors.white, fontSize: fontSizeMd),
            ),
            const SizedBox(
              height: 8,
            ),
            //Form to select crypto that you want withdraw
            Container(
                width: (kSizeUnit * 3.2).w,
                height: 50,
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Form(
                      child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.none,
                    autocorrect: false,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        labelText: "Bitcoin",
                        labelStyle: TextStyle(color: greyLight),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(CryptoFontIcons.BTC, color: greyLight),
                            const AutoSizeText(
                              "BTC",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: greyLight,
                        ),
                        border: InputBorder.none),
                  )),
                )),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 8,
            ),
            const AutoSizeText("Retrait vers"),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: blue1, borderRadius: BorderRadius.circular(10)),
              child: Align(
                  child: AutoSizeText(
                "Recommandé",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
              )),
            ),
            const SizedBox(
              height: 20,
            ),

            PaymentMethodWidget(
                payment: PaymentType.wave, radio: radio, update: _update),
            const SizedBox(
              height: 10,
            ),
            PaymentMethodWidget(
                payment: PaymentType.om, radio: radio, update: _update),
            const SizedBox(
              height: 10,
            ),
            PaymentMethodWidget(
                payment: PaymentType.momo, radio: radio, update: _update),
            const SizedBox(
              height: 10,
            ),
            PaymentMethodWidget(
                payment: PaymentType.moov, radio: radio, update: _update),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(30),
              child: ButtonWidget(
                disable: radio == PaymentType.initial,
                onPressed: () => {},
                title: "Continuer",
                raduis: 10,
              ),
            )
          ],
        ));
  }
}
