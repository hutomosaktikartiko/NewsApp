import 'package:flutter/material.dart';

import 'custom_color.dart';

class ThemeConfig {
  static final ThemeData defaultTheme = ThemeData(
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: CustomColor.main,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}