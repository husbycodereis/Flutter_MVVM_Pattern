import 'package:flutter/material.dart';
import 'package:folder_architecture/core/init/theme/app_theme.dart';
import 'package:folder_architecture/core/init/theme/dark/theme_interface_dark.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark.init();
  }

  AppThemeDark.init();

  ThemeData get theme => ThemeData(
      fontFamily: '',
      primaryColor: colorThemeDark!.red,
      accentColor: colorThemeDark!.azure,
      backgroundColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.grey[800],
      brightness: Brightness.dark,
      textTheme: textTheme());

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeDark!.headline1,
      headline2: textThemeDark!.headline2,
      headline3: textThemeDark!.headline3,
      headline4: textThemeDark!.headline4,
      overline: textThemeDark!.overline,
    );
  }
}
