import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/model/base_view_model.dart';
import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:folder_architecture/core/init/network/vexana_manager.dart';
import 'package:folder_architecture/view/authentication/login/model/login_model.dart';
import 'package:folder_architecture/view/authentication/login/service/ILoginService.dart';
import 'package:folder_architecture/view/authentication/login/service/login_service.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/extensions/context_extensions.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    loginService = LoginService(VexanaManager.instance!.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;
  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController.text, password: passwordController.text));
      if (response != null) {
        scaffoldState.currentState!
            // ignore: deprecated_member_use
            .showSnackBar(SnackBar(
          content: Text(response.token!),
          backgroundColor: context!.customColors.darkGrey,
        ));
        localeManager.setStringValue(SharedPrefKeys.TOKEN, response.token!);
      }
    }
    isLoadingChange();
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
