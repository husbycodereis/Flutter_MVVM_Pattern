import 'package:flutter/material.dart';
import 'package:folder_architecture/core/init/cache/local_manager.dart';
import 'package:folder_architecture/core/init/navigation/navigation_service.dart';
import 'package:folder_architecture/core/init/network/ICoreDio.dart';
import 'package:folder_architecture/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  // VexanaManager? vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  void setContext(BuildContext context);
  void init();
}
