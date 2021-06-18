import 'package:flutter/material.dart';
import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:folder_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    onBoardItems.add(
      OnBoardModel(
          title: LocaleKeys.onBoard_pageOne_title,
          description: LocaleKeys.onBoard_pageOne_description,
          imagePath: SVGImagePaths.instance!.walkingSVG),
    );
    onBoardItems.add(
      OnBoardModel(
          title: LocaleKeys.onBoard_pageTwo_title,
          description: LocaleKeys.onBoard_pageTwo_description,
          imagePath: SVGImagePaths.instance!.alienSVG),
    );
    onBoardItems.add(
      OnBoardModel(
          title: LocaleKeys.onBoard_pageThree_title,
          description: LocaleKeys.onBoard_pageThree_description,
          imagePath: SVGImagePaths.instance!.bugsSVG),
    );
  }

  List<OnBoardModel> onBoardItems = [];

  @observable
  bool isLoading = false;

  @observable
  int currentPageIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentPageIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> completeOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(SharedPrefKeys.IS_FIRST_LOAD, true);
    navigation.navigateToPageClear(
      path: NavigationConstants.TEST_VIEW,
    );
    changeLoading();
  }
}
