import 'package:flutter/material.dart';
import 'package:folder_architecture/core/init/cache/local_manager.dart';
import 'package:folder_architecture/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? context;

  // ICoreDioNullSafety? coreDio = NetworkManager.instance!.;
  // VexanaManager? vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}