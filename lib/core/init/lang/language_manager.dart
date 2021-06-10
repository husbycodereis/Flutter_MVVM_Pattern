import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager? get instance {
     _instance ??= LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final enLocale = Locale("en", "US");

  List<Locale> get supportedLocales => [enLocale];
}


//* generation code is written in scripts folder
//* to run the generation code type to command line the test below
// sh scripts/lang.sh