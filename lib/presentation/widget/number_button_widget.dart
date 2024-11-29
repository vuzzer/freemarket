import 'package:defi/core/enum.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';

class NumberButtonWiget extends StatelessWidget {
  final String touch;
  final TextEditingController controller;
  final bool amount;
  const NumberButtonWiget(
      {super.key,
      required this.touch,
      required this.controller,
      this.amount = false});
  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
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
          backgroundColor: darkMode ? darkBlue : FontColor.white1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          touch,
          style: TextStyle(
              color: darkMode ? FontColor.white : FontColor.black,
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ));
  }
}
