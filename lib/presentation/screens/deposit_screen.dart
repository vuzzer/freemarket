import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/presentation/screens/confirm_deposit_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/keyboard_v2_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class DepositScreen extends StatefulWidget {
  static const routeName = "/deposit";
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  TextEditingController amountController = TextEditingController(text: "0");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Deposit ETH"),
      body: Column(
        children: [
          const SizedBox(
            height: 23,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Field to enter amount of token user buy
                    Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                decoration: const BoxDecoration(),
                                child: Center(
                                    child: TextField(
                                  controller: amountController,
                              
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.none,
                                  autocorrect: false,
                                  cursorColor: Colors.white,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: roboto),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 5),
                                      labelStyle: TextStyle(color: greyLight),
                                      border: InputBorder.none),
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Flexible(
                                flex: 2,
                                child: TextButton.icon(
                                    onPressed: () {
                                      HapticFeedbackTypes.vibrate;
                                    },
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white),
                                    icon: const Icon(Icons.swap_vert),
                                    label: const AutoSizeText("ETH")))
                          ],
                        )),
                    InkWell(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.swap_vert,
                          color: greyLight,
                        ),
                        const AutoSizeText("XOF")
                      ],
                    ))
                  ])),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    
                  ],
                ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(color: blue1),
              child: KeyBoardV2Widget(
                controller: amountController,
                routeName: ConfirmDepositScreen.routeName,
                amount: true,
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
