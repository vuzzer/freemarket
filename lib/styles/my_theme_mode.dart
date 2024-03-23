import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';

class MyThemeMode {
  static ThemeData themeData() {
    bool isDarkMode = sl<BrightnessBloc>().state.brightness == Mode.dark;
    return ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        fontFamily: 'Raleway',
        scaffoldBackgroundColor:
            isDarkMode ? const Color(0XFF171B2F) : FontColor.white,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: isDarkMode ? FontColor.white : FontColor.black ),
        iconTheme: IconThemeData(
            color: isDarkMode ? FontColor.white : FontColor.black),
        splashFactory: InkRipple.splashFactory,
        tabBarTheme: TabBarTheme(
          labelColor: isDarkMode ? FontColor.white : FontColor.black,
        ),
        listTileTheme: ListTileThemeData(
            titleTextStyle: TextStyle(
                color: isDarkMode ? FontColor.white : FontColor.black)),
        appBarTheme: AppBarTheme(
            backgroundColor: isDarkMode ? darkBlue : FontColor.white,
            titleTextStyle: TextStyle(
                color: isDarkMode ? FontColor.white : FontColor.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontFamily: FontFamily.robotoCondensed,
            ),
            headlineMedium: TextStyle(
                fontSize: 37,
                fontFamily: FontFamily.robotoCondensed,
                color: isDarkMode ? FontColor.white : FontColor.black,
                fontWeight: FontWeight.w700),
            headlineSmall: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),

            // For token price details
            bodySmall: TextStyle(
                color: isDarkMode ? FontColor.white : FontColor.black,
                fontFamily: roboto,
                fontSize: 14),
            displayMedium: TextStyle(
                color:
                    isDarkMode ? Colors.grey.withOpacity(0.6) : FontColor.black,
                fontSize: 20,
                fontFamily: FontFamily.robotoCondensed),
            bodyLarge: TextStyle(color: Colors.grey.withOpacity(0.6)),
            bodyMedium: TextStyle(
                color: isDarkMode ? FontColor.white : FontColor.black)));
  }
}
