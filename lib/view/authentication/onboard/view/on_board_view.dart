import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import 'package:folder_architecture/core/base/view/base_view.dart';
import 'package:folder_architecture/core/components/text/locale_text.dart';
import 'package:folder_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:folder_architecture/core/extensions/context_extensions.dart';
import 'package:folder_architecture/core/init/cache/locale_manager.dart';
import 'package:folder_architecture/view/_product/_widgets/avatar/on_board_circle.dart';
import 'package:folder_architecture/view/authentication/onboard/model/on_board_model.dart';
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
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        itemCount: viewModel.onBoardItems.length,
        onPageChanged: (value) => viewModel.changeCurrentIndex(value),
        itemBuilder: (context, index) {
          return buildMainContenColumnBody(
              context, viewModel.onBoardItems[index]);
        });
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildDotIndicator(viewModel),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(
              visible: viewModel.isLoading, child: CircularProgressIndicator());
        }))),
        buildFloatingActionButton(context, viewModel)
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: context.height * 0.025,
        ),
        onPressed: () {
          print(LocaleManager.instance
              .getBoolValue(SharedPrefKeys.IS_FIRST_LOAD));
          // viewModel.completeOnBoard();
        });
  }

  ListView buildDotIndicator(OnBoardViewModel viewModel) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.onBoardItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Observer(
            builder: (_) {
              return OnBoardCircle(
                  isSelected: viewModel.currentPageIndex == index);
            },
          );
        });
  }

  Column buildMainContenColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath!)),
        buildDescriptionColumn(context, model),
      ],
    );
  }

  Column buildDescriptionColumn(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        LocaleText(
          model.title!,
          style: context.textTheme.headline1,
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: LocaleText(
            model.description!,
            textAlign: TextAlign.center,
            style: context.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
