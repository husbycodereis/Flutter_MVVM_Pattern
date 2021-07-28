import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/model/base_view_model.dart';
import 'package:folder_architecture/core/components/models/user/user.dart';
import 'package:folder_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:folder_architecture/core/init/notifier/theme_notifier.dart';
import 'package:folder_architecture/view/settings/model/settings_dynamic_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'settings_view_model.g.dart';
part 'subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  void changeAppTheme() {
    context!.read<ThemeNotifier>().changeTheme();
  }
}
