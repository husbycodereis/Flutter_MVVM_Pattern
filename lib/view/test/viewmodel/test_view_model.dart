import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/model/base_view_model.dart';
import 'package:folder_architecture/core/constants/enums/http_request_enum.dart';
import 'package:folder_architecture/core/init/notifier/theme_notifier.dart';
import 'package:folder_architecture/view/test/model/test_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  int counter = 0;

  @computed
  bool get isEven => counter % 2 == 0;

  @action
  void incrementCounter() {
    counter++;
  }

  @action
  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false).changeTheme();
  }

  Future<void> getSampleRequest() async {
    isLoading = true;
    final list = await coreDio!.send<List<TestModel>, TestModel>('x',
        type: HttpTypes.GET, parseModel: TestModel());
    if (list is List<TestModel>) {
      print(true);
    }
    isLoading = false;
  }
}
