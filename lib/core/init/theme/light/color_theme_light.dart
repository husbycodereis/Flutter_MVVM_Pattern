import 'package:flutter/material.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight? get instance {
    _instance ??= ColorThemeLight.init();
    return _instance;
  }

  ColorThemeLight.init();

  final Color brown = Color(0xffa87e6f);
  final Color red = Color(0xffc10e0e);
  final Color white = Color(0xffffffff);
  final Color gray = Color(0xffa5a6ae);
  final Color lightGray = Color(0xfff7f7f7);
  final Color darkGray = Color(0xff676870);
  final Color black = Color(0xff020306);
  final Color azure = Color(0xff27928d);
  
  // final ColorScheme colorScheme = ColorScheme(
  //     primary: Colors.black,
  //     primaryVariant: Colors.white, //xx
  //     secondary: Colors.green,
  //     secondaryVariant: Colors.teal,
  //     surface: Colors.blue, //xx
  //     background: Color(0xfff6f9fc), //xx
  //     error: Colors.red[900]!,
  //     onPrimary: Colors.greenAccent,
  //     onSecondary: Colors.black, //x
  //     onSurface: Colors.white30,
  //     onBackground: Colors.black12,
  //     onError: Color(0xFFF9B916), //xx
  //     brightness: Brightness.light);
}
