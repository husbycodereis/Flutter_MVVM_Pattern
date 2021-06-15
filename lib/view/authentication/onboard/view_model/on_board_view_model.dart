import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/model/base_view_model.dart';
import 'package:folder_architecture/view/authentication/onboard/model/on_board_model.dart';
import 'package:mobx/mobx.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    onBoardItems =
        List.generate(5, (index) => OnBoardModel(text: index.toString()));
  }

  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentPageIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentPageIndex = value;
  }
}
