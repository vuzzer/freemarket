import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class NumberButtonWiget extends StatelessWidget {
  final int touch;
  final TextEditingController controller;
  final bool amount;
  const NumberButtonWiget(
      {Key? key,
      required this.touch,
      required this.controller,
      this.amount = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          //If Keyboard is activate for pincode, number is limited to 4
          if (!amount && controller.text.length < 4) {
            controller.text += touch.toString();
          } else {
            controller.text += touch.toString();
            // Change the cursor position
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
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
