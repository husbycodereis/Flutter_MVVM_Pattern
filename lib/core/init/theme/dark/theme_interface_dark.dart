import 'package:folder_architecture/core/init/theme/dark/color_theme_dark.dart';
import 'package:folder_architecture/core/init/theme/dark/text_theme_dark.dart';

abstract class IDarkTheme {
  TextThemeDark? textThemeDark = TextThemeDark.instance;
  ColorThemeDark? colorThemeDark = ColorThemeDark.instance;
}
