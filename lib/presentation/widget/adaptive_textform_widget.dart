import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return TextFormField(
      focusNode: alertFocus,
      controller: controller,
      onChanged: (value) {},
      keyboardType: TextInputType.none,
      autocorrect: false,
      cursorColor: darkMode ? FontColor.white : FontColor.black,
      enableSuggestions: false,
      style: TextStyle(
          color: darkMode ? FontColor.white : FontColor.black,
          fontFamily: FontFamily.robotoCondensed),
      enableInteractiveSelection: false, // disable paste
      decoration: InputDecoration(
          labelText: alert.title,
          prefixIcon: Icon(
            alert.icon,
            size: 15,
          ),
          prefixIconColor: darkMode ? FontColor.white : FontColor.black,
          contentPadding: const EdgeInsets.only(bottom: 10),
          labelStyle: TextStyle(color: darkMode ? greyLight : FontColor.black),
          suffixIcon: const Icon(
            Icons.percent,
            size: 12,
          ),
          suffixIconColor: darkMode ? FontColor.white : FontColor.black,
          border: InputBorder.none),
    );
  }
}
