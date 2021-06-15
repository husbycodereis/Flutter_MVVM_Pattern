import 'package:folder_architecture/core/init/network/IResponseModel.dart';

class BaseError extends IErrorModel{
  final String? message;
  BaseError({
    required this.message,
  });
}
