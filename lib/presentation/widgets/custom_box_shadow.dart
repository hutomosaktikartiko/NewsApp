import 'package:flutter/material.dart';

class CustomBoxShadow {
  static BoxShadow defaultBoxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 0),
    );
  }

  static BoxShadow customBoxShadow({
    required double spreadRadius,
    required double blurRadius,
    required Offset offset,
    required Color color,
  }) {
    return BoxShadow(
      color: color,
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      offset: offset,
    );
  }
}
