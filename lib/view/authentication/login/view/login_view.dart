import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/view/base_view.dart';
import 'package:folder_architecture/view/authentication/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
        },
        onPageBuilder: (BuildContext context, LoginViewModel value) =>
            Scaffold());
  }
}
