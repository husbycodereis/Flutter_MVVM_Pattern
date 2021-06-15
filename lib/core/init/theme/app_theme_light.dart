import 'package:flutter/material.dart';
import 'package:folder_architecture/core/init/theme/app_theme.dart';
import 'package:folder_architecture/core/init/theme/light/theme_interface_light.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }
  AppThemeLight._init();

  ThemeData get theme => ThemeData(
      fontFamily: '',
      primaryColor: colorThemeLight!.red,
      accentColor: colorThemeLight!.azure,
      textTheme: textTheme());

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight!.headline1,
      headline2: textThemeLight!.headline2,
      headline3: textThemeLight!.headline3,
      headline4: textThemeLight!.headline4,
      overline: textThemeLight!.overline,
    );
  }
}
