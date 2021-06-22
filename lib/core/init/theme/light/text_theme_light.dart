import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    _instance ??= TextThemeLight.init();
    return _instance;
  }

  TextThemeLight.init();

  final TextStyle headline1 =
      TextStyle(fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: -1.5);
  final TextStyle headline2 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline4 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final TextStyle overline =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
  final TextStyle bodyText1 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.5);
  final TextStyle bodyText2 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
}
