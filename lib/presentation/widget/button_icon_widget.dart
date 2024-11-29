import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final double raduis;
  final VoidCallback onPressed;
  const ButtonIconWidget(
      {super.key, required this.iconData, required this.label, this.raduis = 30, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(raduis)),
            fixedSize: const Size(160, 50),
            backgroundColor: blueLight),
        icon: Icon(iconData),
        label: AutoSizeText(label));
  }
}
