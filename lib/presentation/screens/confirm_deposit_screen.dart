import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:defi/helpers/enum.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmDepositScreen extends StatefulWidget {
  static const routeName = "/confirm-deposit";
  const ConfirmDepositScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmDepositScreen> createState() => _ConfirmDepositScreenState();
}

class _ConfirmDepositScreenState extends State<ConfirmDepositScreen> {
  PaymentType radio = PaymentType.initial;
  //final networks = NetworkType.enabledValues;
  void _update(PaymentType value) {
    radio = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: "Déposer"),
        body: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "Dépôt de XOF",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeMd.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: blue),
                    //icon: const Icon(Icons.help),
                    child: const AutoSizeText("Recours"),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: (kSizeUnit * 3.35).w,
                height: 50,
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: TextFormField(
                  enabled: false,
                  keyboardType: TextInputType.none,
                  autocorrect: false,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Icon(CryptoFontIcons.USDT, color: greyLight),
                      contentPadding: const EdgeInsets.only(bottom: 10),
                      labelText: "XOF",
                      labelStyle: TextStyle(color: greyLight),
                      border: InputBorder.none),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText("Dépôt avec"),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(10)),
                child: Align(
                    alignment: Alignment.centerLeft,
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
          ),
        ));
  }
}
