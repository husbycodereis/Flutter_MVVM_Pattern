import 'package:flutter/material.dart';
import 'package:folder_architecture/view/_widgets/button/login_button.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../view_model/login_view_model.dart';

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
            buildBody(context));
  }

  Scaffold buildBody(BuildContext context) => Scaffold(
        body: Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoginButton(onComplete: (data) {})],
          ),
        ),
      );
}
