import 'package:flutter/material.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager manager;
  ILoginService({
    required this.manager,
  });

  Future<LoginResponseModel?> fetchUserControl(LoginModel model, BuildContext context);
}
