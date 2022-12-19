import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SecretCodeWidget extends StatelessWidget {
  const SecretCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return  Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: blueLight,
        shape: BoxShape.circle
      ),
    );
  }
}
