import 'package:flutter/material.dart';

class ScreenNavigator {
  static startScreen(BuildContext context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

  static replaceScreen(BuildContext context, Widget screen) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));

  static removeAllScreen(BuildContext context, Widget screen) =>
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => screen), (route) => false);

  static removeScreen(BuildContext context, Widget screen) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));

  static closeScreen<T extends Object?>(BuildContext context, [T? value]) =>
      Navigator.pop<T>(context, value);
}