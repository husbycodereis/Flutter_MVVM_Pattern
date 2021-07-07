import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:folder_architecture/core/components/models/query/user_query.dart';
import 'package:folder_architecture/core/components/utility/throttle_helper.dart';
import 'package:mobx/mobx.dart';

import 'package:folder_architecture/core/base/model/base_view_model.dart';
import 'package:folder_architecture/view/home/social/model/social_user_model.dart';
import 'package:folder_architecture/view/home/social/service/ISocialService.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SoicalViewModelBase with _$SocialViewModel;

abstract class _SoicalViewModelBase with Store, BaseViewModel {
  final ISocialService socialService;
  late ThrottleStringHelper _throttleStingHelper;
  _SoicalViewModelBase(
    this.socialService,
  );
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _throttleStingHelper = ThrottleStringHelper();
    fetchAllUsers();
  }

  @observable
  bool isLoading = false;

  @observable
  List<SocialUser> socialUserList = [];

  @action
  Future<void> fetchAllUsers() async {
    isLoadingChange();
    final response = await socialService.fetchUserHouseList(UserQuery(albumId: 1), context!);
    socialUserList = response;
    isLoadingChange();
  }

  @action
  void fetchAllSearchQuery(String text) {
    _throttleStingHelper.onDelayTouch(text, (text) => log(text!));
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
