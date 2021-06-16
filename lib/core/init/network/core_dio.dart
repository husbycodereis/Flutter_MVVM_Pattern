import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:folder_architecture/core/base/model/base_error.dart';
import 'package:folder_architecture/core/base/model/base_model.dart';
import 'package:folder_architecture/core/constants/enums/http_request_enum.dart';
import 'package:folder_architecture/core/extensions/network_extensions.dart';
import 'package:folder_architecture/core/init/network/ICoreDio.dart';
import 'package:folder_architecture/core/init/network/IResponseModel.dart';

part 'package:folder_architecture/core/init/network/network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  //R means Response, R and T are generic types as placeholder types
  //* <R, T> means give back R model and accept T model.

  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser(parseModel, response.data);
        return ResponseModel<R>(data: model);

      default:
        return ResponseModel(
            error: BaseError(message: response.statusCode.toString()));
    }
  }

  //example demonstration of R, T  types
  ReturningType returner<ArgumentType, ReturningType>(ArgumentType someType) {
    final dynamic someModel = someType;
    return someModel;
  }
}
