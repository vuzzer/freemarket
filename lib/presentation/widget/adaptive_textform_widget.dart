import 'dart:io';

import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/base_type.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdapativeTextFormWidget extends StatelessWidget {
  final FocusNode alertFocus;
  final TextEditingController controller;
  final Alert alert;
  const AdapativeTextFormWidget(
      {super.key,
      required this.alertFocus,
      required this.controller,
      required this.alert});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? TextFormField(
            focusNode: alertFocus,
            controller: controller,
            keyboardType: TextInputType.none,
            autocorrect: false,
            cursorColor: Colors.white,
            enableSuggestions: false,
            style: TextStyle(
                color: Colors.white, fontFamily: FontFamily.robotoCondensed),
            enableInteractiveSelection: false, // disable paste
            decoration: InputDecoration(
                labelText: alert.title,
                prefixIcon: Icon(
                  alert.icon,
                  size: 15,
                ),
                prefixIconColor: Colors.white,
                contentPadding: const EdgeInsets.only(bottom: 10),
                labelStyle: TextStyle(color: greyLight),
                suffixIcon: const Icon(
                  Icons.percent,
                  size: 12,
                ),
                suffixIconColor: Colors.white,
                border: InputBorder.none),
          )
        : CupertinoTextField(
          decoration: const BoxDecoration(color: blue1),
          focusNode: alertFocus,
            controller: controller,
            cursorColor: CupertinoColors.white,
            style: TextStyle(
                color: CupertinoColors.white,
                fontFamily: FontFamily.robotoCondensed),
            keyboardType: TextInputType.number,
            placeholder:  alert.title,
            placeholderStyle: const TextStyle(color: CupertinoColors.white ),
            prefix: Icon(
              alert.icon,
              size: 15,
              color: CupertinoColors.white,
            ),
            suffix: const Icon(
              Icons.percent,
              size: 12,
              color: CupertinoColors.white,
            ),
          );
  }
}
