import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodePwdWidget extends StatelessWidget {
  final TextEditingController controller;
  const PinCodePwdWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: PinCodeTextField(
        controller: controller,
        obscureText: true,
        appContext: context,
        length: 4,
        onChanged: (String code) {},
        keyboardType: TextInputType.none,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.circle,
          borderRadius: BorderRadius.circular(10),
          fieldWidth: 22,
          fieldHeight: 22,
        activeColor: blue,
          activeFillColor: const Color(0xFFF6F6F6),
          selectedFillColor: const Color(0xFFF6F6F6),
          selectedColor: Colors.grey.withOpacity(0.666),
          inactiveColor: Colors.grey.withOpacity(0.4),
          inactiveFillColor: const Color(0xFFF6F6F6),
        ),
        onCompleted: (String finalCode) {
          print(finalCode);
        },
        animationType: AnimationType.fade,
        animationCurve: Curves.slowMiddle,
        animationDuration: const Duration(milliseconds: 100),
        cursorColor: Colors.white,
      ),
    );
  }
}
