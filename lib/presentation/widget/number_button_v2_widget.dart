import 'package:defi/constants/app_colors.dart';
import 'package:defi/helpers/number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class NumberButtonV2Wiget extends StatelessWidget {
  final int touch;
  final TextEditingController controller;
  final bool amount;
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(double.parse(s));
  //String get _currency =>NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
  const NumberButtonV2Wiget(
      {Key? key,
      required this.touch,
      required this.controller,
      this.amount = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (controller.text == "0" &&
              (touch.toString() != "0" || touch.toString() == "0")) {
            controller.text = touch.toString();
          } else {
            controller.text += touch.toString();
            //logger.d(controller.text);
            //format Number in
            //NumberFormat myFormat = NumberFormat.decimalPattern("en_us");
            controller.text =
                _formatNumber(controller.text.replaceAll(',', ''));

            // Change the cursor position
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
            logger.d(controller.text);
          }
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          minimumSize: const Size.square(60),
          backgroundColor: darkBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          "$touch",
          style: const TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ));
  }
}
