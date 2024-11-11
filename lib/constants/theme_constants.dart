
import 'package:campus_camaraderie_web/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  ThemeConstants();

  // LIGHT THEME COLORS
  static  MaterialColor lightThemeColors =
      MaterialColor(0xFF51B1C0, {
    50:  ColorConstants.primaryColors50,
    100: ColorConstants.primaryColors100,
    200: ColorConstants.primaryColors200,
    300: ColorConstants.primaryColors300,
    400: ColorConstants.primaryColors400,
    500: ColorConstants.primaryColors500,
    600: ColorConstants.primaryColors600,
    700: ColorConstants.primaryColors700,
    800: ColorConstants.primaryColors800,
    900: ColorConstants.primaryColors900
  });

  // LIGHT THEME
  static ThemeData LightTheme = ThemeData(
      fontFamily: "Inter",
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorConstants.whiteColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // primaryColorLight: Color,
      primarySwatch: lightThemeColors,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        titleLarge: TextStyle(
            color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ));
}
