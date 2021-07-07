import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/model/base_view_model.dart';
import 'package:folder_architecture/core/init/lang/locale_keys.g.dart';
import 'package:mobx/mobx.dart';
part 'game_view_model.g.dart';

class GameViewModel = _GameViewModelBase with _$GameViewModel;

abstract class _GameViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final List<String> gameTabItems = [
    LocaleKeys.game_tabbar_tab1 ,
    LocaleKeys.game_tabbar_tab2,
    LocaleKeys.game_tabbar_tab3,
    LocaleKeys.game_tabbar_tab4,
    LocaleKeys.game_tabbar_tab5,
  ];
}
