import 'package:folder_architecture/core/extensions/string_extensions.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths? get instance {
    _instance ??= SVGImagePaths.init();
    return _instance;
  }

  SVGImagePaths.init();

  final walkingSVG = 'walking_outside'.toSVG;
  final bugsSVG = 'corpo_bugs'.toSVG;
  final alienSVG = 'corpo_alien'.toSVG;
  final loginGirlSVG = 'login_girl'.toSVG;
}
