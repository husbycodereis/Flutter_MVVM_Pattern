import 'package:flutter/material.dart';
import 'package:folder_architecture/core/components/utility/service_helper.dart';
import 'package:folder_architecture/core/constants/enums/network_route_enum.dart';
import 'package:vexana/vexana.dart';


import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(INetworkManager manager) : super(manager: manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model, BuildContext context) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetWorkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);
    showMessage(response.error, context);
    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
