import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:folder_architecture/core/base/view/base_view.dart';
import 'package:folder_architecture/core/extensions/context_extensions.dart';
import 'package:folder_architecture/view/_widgets/listview/on_board_indicator.dart';
import 'package:folder_architecture/view/authentication/onboard/view_model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
        viewModel: OnBoardViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
            Scaffold(
              body: buildColumnBody(viewModel),
            ));
  }

  Column buildColumnBody(OnBoardViewModel viewModel) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: buildPageView(viewModel),
        ),
        Expanded(child: buildObserverOnBoardIndicator(viewModel))
      ],
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        onPageChanged: (value) {
          viewModel.changeCurrentIndex(value);
        },
        itemCount: 5,
        itemBuilder: (context, index) => Container(
            color: context.randomColor,
            child: Column(
              children: [
                Placeholder(),
                Text(viewModel.onBoardItems[index].text!)
              ],
            )));
  }

  Observer buildObserverOnBoardIndicator(OnBoardViewModel viewModel) {
    return Observer(builder: (_) {
      return OnBoardIndicator(
          itemCount: viewModel.onBoardItems.length,
          currentIndex: viewModel.currentPageIndex);
    });
  }
}
