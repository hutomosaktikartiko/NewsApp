import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double defaultMargin;
  static late Duration panelTransition;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;
    defaultMargin = 25;
    panelTransition = Duration(milliseconds: 500);
  }
}