import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../viewmodel/login_view_model.dart';

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
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mediumValue),
              child: Container(
                height: context.height * 0.8,
                color: context.theme.backgroundColor,
                child: Padding(
                  padding: context.paddingLow,
                  child: Text(
                    'hello',
                    style: context.textTheme.bodyText1,
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
