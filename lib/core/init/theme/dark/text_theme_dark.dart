import 'package:flutter/material.dart';

class TextThemeDark {
  static TextThemeDark? _instance;
  static TextThemeDark get instance {
   return _instance ??= TextThemeDark.init();
  
  }

  TextThemeDark.init();

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
}
