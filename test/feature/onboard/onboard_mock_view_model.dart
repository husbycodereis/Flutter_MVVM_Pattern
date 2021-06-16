import 'package:dio/dio.dart';
import 'package:folder_architecture/core/constants/enums/http_request_enum.dart';
import 'package:folder_architecture/core/init/network/core_dio.dart';
import 'package:folder_architecture/view/authentication/onboard/model/on_board_model.dart';
import 'package:folder_architecture/core/init/network/ICoreDio.dart';
import 'package:folder_architecture/core/init/navigation/navigation_service.dart';
import 'package:folder_architecture/core/init/cache/local_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:folder_architecture/view/authentication/onboard/view_model/on_board_view_model.dart';

import '../../core/network/dio_mock_model.dart';

class OnBoardViewMockModel implements OnBoardViewModel {
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
  List<OnBoardModel> onBoardItems = [];

  @override
  void changeCurrentIndex(int value) {
    currentPageIndex = value;
  }

  @override
  void init() {
    coreDio =
        CoreDio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
    stringHelper = MockStringHelper();
  }

  @override
  void setContext(BuildContext context) {}

  Future<void> onBoardGetModels() async {
    onBoardItems = [OnBoardModel(text: '1')];
    final response = await coreDio!.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());
    if (response.data is List) {
      onBoardItems = response.data!
          .map((e) => OnBoardModel(text: stringHelper.toUpper(e.title!)))
          .toList();
    }
  }

  Future<void> getServiceRequest() async {
    isLoading = true;
    await onBoardGetModels();
    isLoading = false;
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
