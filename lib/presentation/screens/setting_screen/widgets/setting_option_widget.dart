import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SettingOptionWidget extends StatelessWidget {
  const SettingOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size((kSizeUnit * 3.2).w, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: blue1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(Icons.language),
              ),
              const SizedBox(
                width: 7,
              ),
              AutoSizeText(
                "Language",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}