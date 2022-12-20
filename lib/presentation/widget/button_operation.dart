//This button is used for operation following:
//buy crypto
//withdraw money
//deposit money
//send money
//Receive money

import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonOperation extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const ButtonOperation({super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: blueLight,
          minimumSize: const Size.square(55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      )
    ]);
  }
}
