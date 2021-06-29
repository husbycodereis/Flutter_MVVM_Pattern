
import 'package:dio/dio.dart';

import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
   return _instance ??= NetworkManager._init();
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: 'https://reqres.in/api',
        headers: {
          'val': LocaleManager.instance.getStringValue(SharedPrefKeys.TOKEN)
        });

    coreDio = CoreDio(baseOptions);
  }
}
