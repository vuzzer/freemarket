import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LimitPrizeWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const LimitPrizeWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: blueLight,
        minimumSize: const Size.square(55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: const AutoSizeText("Min 1000"),
    );
  }
}
