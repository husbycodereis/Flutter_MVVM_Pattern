import 'dart:io';

import 'package:dio/dio.dart';
import 'package:folder_architecture/core/base/model/base_error.dart';
import 'package:folder_architecture/core/base/model/base_model.dart';
import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:folder_architecture/core/init/cache/local_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "val": LocaleManager.instance.getStringValue(SharedPrefKeys.TOKEN)
        });
    _dio = Dio(baseOptions);

    _dio!.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   options.path += 'ali';
      // },
      onResponse: (e, handler) {
        return e.data;
      },
      onError: (e, handler) {
        BaseError(message: e.message);
      },
    ));
  }

  Dio? _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((item) => model.fromJson(item)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody as Map<String, Object>);
        }
        return responseBody;
      default:
    }
  }
}
