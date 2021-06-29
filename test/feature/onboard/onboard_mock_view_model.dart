import 'package:dio/dio.dart';
import 'package:folder_architecture/core/constants/enums/http_request_enum.dart';
import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:folder_architecture/core/init/network/core_dio.dart';
import 'package:folder_architecture/core/init/network/vexana_manager.dart';
import 'package:folder_architecture/view/authentication/onboard/model/on_board_model.dart';
import 'package:folder_architecture/core/init/network/ICoreDio.dart';
import 'package:folder_architecture/core/init/navigation/navigation_service.dart';
import 'package:folder_architecture/core/init/cache/locale_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:folder_architecture/view/authentication/onboard/view_model/on_board_view_model.dart';

import '../../core/network/dio_mock_model.dart';

class OnBoardViewMockModel implements OnBoardViewModel {
  @override
  bool isLoading = false;
  late IStringHelper stringHelper;

  @override
  BuildContext? context;

  @override
  ICoreDioNullSafety? coreDio;

  @override
  int currentPageIndex = 0;

  @override
  late LocaleManager localeManager;

  @override
  late NavigationService navigation;

  @override
  VexanaManager? vexanaManager;

  @override
  List<OnBoardModel> onBoardItems = [];

  @override
  void changeCurrentIndex(int value) {
    currentPageIndex = value;
  }

  @override
  void init() {
    coreDio =
        CoreDio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
    stringHelper = MockStringHelper();
    localeManager = LocaleManager.instance;
    vexanaManager = VexanaManager.instance!;
  }

  @override
  void setContext(BuildContext context) {}

  Future<void> onBoardGetModels() async {
    onBoardItems = [OnBoardModel(title: '1')];
    final response = await coreDio!.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());
    if (response.data is List) {
      onBoardItems = response.data!
          .map((e) => OnBoardModel(title: stringHelper.toUpper(e.title!)))
          .toList();
    }
  }

  Future<void> getServiceRequest() async {
    isLoading = true;
    await onBoardGetModels();
    isLoading = false;
  }

  @override
  Future<void> completeOnBoard() async {
    await localeManager.setBoolValue(SharedPrefKeys.IS_FIRST_LOAD, true);
  }

  @override
  void changeLoading() {
    // TODO: implement changeIsLoading
  }
}

abstract class IStringHelper {
  String toUpper(String data);
}

class MockStringHelper extends IStringHelper {
  @override
  String toUpper(String data) {
    return data.toUpperCase();
  }
}
