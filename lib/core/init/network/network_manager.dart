
import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/local_manager.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "val": LocaleManager.instance.getStringValue(SharedPrefKeys.TOKEN)
        });

    coreDio = CoreDio(baseOptions);
  }
}
