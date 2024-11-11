import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ColorConstants {
  var defaultSize;

  ColorConstants();




  static const Color primaryColor = Color(0xff161668);
  static const Color secondaryColor = Color(0xff7F56D9);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color color80FFFFFF = Color(0x80ffffff);
  static const Color colorPrimary = Color(0xffF88D7D);
  static const Color colorFF795B = Color(0xffFF795B);
  static const Color textBlack = Color(0xff000000);
  static const Color textFontBlue = Color(0xff101828);
  static const Color textDescription = Color(0xff475467);
  static const Color textFieldColors = Color(0xff344054);
  static const Color buttonPrimaryColor = Color(0xff161668);
  static const Color buttonSecondaryColor = Color(0xffFFFFFF);
  static const Color buttonFontPrimaryColor = Color(0xffFFFFFF);
  static const Color buttonFontSecondaryColor = Color(0xff101828);
  static const Color buttonHintColor = Color(0xffD0D5DD);
  static const Color textHintColor = Color(0xffD0D5DD);
  static const Color redColor = Color(0xffff0000);
  static const Color blackColor = Color(0xff000000);
  static const Color greyColor = Color.fromRGBO(232, 236, 244, 1);





  static const Color inputFieldGrey = Color.fromRGBO(250, 250, 250, 1);



//Color shades
  static const Color primaryColors = Color.fromRGBO(22, 22, 104, 1.0);
  static const Color primaryColors50 = Color.fromRGBO(1, 97, 102, 0.1);
  static const Color primaryColors100 = Color.fromRGBO(22, 22, 104, 0.2);
  static const Color primaryColors200 = Color.fromRGBO(22, 22, 104, 0.3);
  static const Color primaryColors300 = Color.fromRGBO(22, 22, 104, 0.4);
  static const Color primaryColors400 = Color.fromRGBO(22, 22, 104, 0.5);
  static const Color primaryColors500 = Color.fromRGBO(22, 22, 104, .6);
  static const Color primaryColors600 = Color.fromRGBO(22, 22, 104, .7);
  static const Color primaryColors700 = Color.fromRGBO(22, 22, 104, .8);
  static const Color primaryColors800 = Color.fromRGBO(22, 22, 104, .9);
  static const Color primaryColors900 = Color.fromRGBO(22, 22, 104, 1);



}







bool isColorDark(Color color) {
  if (kDebugMode) {
    print("ds${colorDarkness(color)}");
  }
  if (colorDarkness(color) < 0.5) {
    return false; // It's a light color
  } else {
    return true; // It's a dark color
  }
}

double colorDarkness(Color color) {
  return 1 - (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
}

MaterialColor getMaterialColor(Color color) {
  final Map<int, Color> shades = {
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  return MaterialColor(color.value, shades);
}


// Get the proportionate fontsize as per screen size
double getFont(double size) {
  var defaultSize = "orientation" == Orientation.landscape
      ? Get.height * 0.024
      : Get.width * 0.024;
  double defaultsSize = defaultSize * size;
  return (defaultsSize / 10);
  /*double screenWidth = MediaQuery.of(Get.context!).size.width;
  // DevicePixelRatio accounts for browser zoom level
  double adjustedSize = screenWidth / (MediaQuery.of(Get.context!).devicePixelRatio * 100);
  // Scale the font size based on the base size
  return size * adjustedSize;*/
}

// Get the proportionate height as per screen size
double getHeight(double inputHeight) {
  double screenHeight = Get.height;
  // 812 is the layout height that designer use
  return (inputHeight / screenHeight) * screenHeight;
}

// Get the proportionate width as per screen size
double getWidth(double inputWidth) {
  double screenWidth = Get.width;
  // 375 is the layout width that Figma provides
  return (inputWidth / screenWidth) * screenWidth;
}

// Get the proportionate padding as per screen size
double getPadding(double inputPadding) {
  double screenWidth = Get.width;
  // 375 is the layout width that Figma provides
  return (inputPadding / screenWidth) * screenWidth;
}