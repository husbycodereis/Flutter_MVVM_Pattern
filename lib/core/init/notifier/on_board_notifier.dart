import 'package:flutter/material.dart';
import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:folder_architecture/core/init/cache/locale_manager.dart';

class OnBoardNotifier extends ChangeNotifier {
  bool _isOnbardViewed =
      LocaleManager.instance.getBoolValue(SharedPrefKeys.IS_FIRST_LOAD);
  bool get isOnBoardViewed => _isOnbardViewed;
}
