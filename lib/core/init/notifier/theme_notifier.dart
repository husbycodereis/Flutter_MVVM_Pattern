import 'package:flutter/material.dart';
import 'package:folder_architecture/core/constants/enums/app_theme_enum.dart';
import 'package:folder_architecture/core/init/theme/app_theme_dark.dart';
import 'package:folder_architecture/core/init/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  AppThemes _currenThemeEnum = AppThemes.LIGHT;

  ThemeData get currentTheme => _currentTheme;
  AppThemes get currenThemeEnum => _currenThemeEnum;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currenThemeEnum == AppThemes.LIGHT) {
      _currenThemeEnum = AppThemes.DARK;
      _currentTheme = AppThemeDark.instance.theme;
      print(_currenThemeEnum.toString());
      print(_currentTheme.toString());
    } else {
      _currenThemeEnum = AppThemes.LIGHT;
      _currentTheme = AppThemeLight.instance.theme;
      print(_currenThemeEnum.toString());
      print(_currentTheme.toString());
    }
    notifyListeners();
  }
}
