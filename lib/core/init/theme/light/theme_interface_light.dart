import 'package:folder_architecture/core/init/theme/light/color_theme_light.dart';
import 'package:folder_architecture/core/init/theme/light/text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight? textThemeLight = TextThemeLight.instance;
  ColorThemeLight? colorThemeLight = ColorThemeLight.instance;
}
