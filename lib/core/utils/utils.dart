import 'package:flutter/material.dart';

class Utils {
  static void hideKeyboard({
    required BuildContext context,
  }) => FocusScope.of(context).requestFocus(FocusNode());
}