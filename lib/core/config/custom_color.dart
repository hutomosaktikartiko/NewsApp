import 'package:flutter/material.dart';

class CustomColor {
  static final Color main = Color(0xFF69A3DF);
  static final Color main2 = Color(0xFF2173CD);
  static final Color light = Color(0xFFF6F6F6);
  static final Color white = Color(0xFFFFFFFF);
  static final Color pending = Color(0xFFFFFCF1);
  static final Color rejectBg = Color(0xFFFFFCF1);
  static final Color verifiedBg = Color(0xFFF1FFF5);
  static final Color whiteBg = Color(0xFFF0EFF2);

  // Gradient Color
  static LinearGradient linearGradient({
    AlignmentGeometry end = Alignment.topCenter,
    AlignmentGeometry begin = Alignment.bottomCenter,
    required Color colorBegin,
    required Color colorEnd,
  }) =>
      LinearGradient(
        begin: begin,
        end: end,
        colors: [colorBegin, colorEnd],
      );
}

class UniversalColor {
  static final Color gray1 = Color(0xFF333333);
  static final Color gray2 = Color(0xFF4F4F4F);
  static final Color gray3 = Color(0xFF828282);
  static final Color gray4 = Color(0xFFBDBDBD);
  static final Color gray5 = Color(0xFFE0E0E0);
  static final Color gray6 = Color(0xFFF2F2F2);
  static final Color red = Color(0xFFEB5757);
  static final Color orange = Color(0xFFF2994A);
  static final Color yellow = Color(0xFFF2C94C);
  static final Color green1 = Color(0xFF219653);
  static final Color green2 = Color(0xFF27AE60);
  static final Color green3 = Color(0xFF6FCF97);
  static final Color green4 = Color(0xFF42D07D);
  static final Color blue1 = Color(0xFF2F80ED);
  static final Color blue2 = Color(0xFF2D9CDB);
  static final Color blue3 = Color(0xFF56CCF2);
  static final Color purple1 = Color(0xFF9B51E0);
  static final Color purple2 = Color(0xFFBB6BD9);
  static final Color activeLink = Color(0xFF73B9E0);
  static final Color hoverDanger = Color(0xFFF23434);
  static final Color dangerClicked = Color(0xFFD83636);
}