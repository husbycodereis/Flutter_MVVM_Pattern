import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  SharedPreferences? _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) => _preferences = value);
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  void setStringValue(SharedPrefKeys key, String value) {
    _preferences!.setString(key.toString(), value);
  }

  String getStringValue(SharedPrefKeys? key) =>
      _preferences!.getString(key.toString()) ?? '';
}
