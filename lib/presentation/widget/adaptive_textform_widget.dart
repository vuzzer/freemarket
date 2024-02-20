import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/styles/font_family.dart';
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
    return TextFormField(
      focusNode: alertFocus,
      controller: controller,
      onChanged: (value) {
       
      },
      keyboardType:  TextInputType.none,
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
    );
  }
}
