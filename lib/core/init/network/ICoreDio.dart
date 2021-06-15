//I means an interface

import 'package:folder_architecture/core/base/model/base_model.dart';
import 'package:folder_architecture/core/constants/enums/http_request_enum.dart';
import 'package:folder_architecture/core/init/network/IResponseModel.dart';

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
