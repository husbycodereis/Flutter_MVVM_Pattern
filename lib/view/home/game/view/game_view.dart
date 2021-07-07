import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/view/base_view.dart';
import 'package:folder_architecture/core/components/widgets/button/header_button.dart';
import 'package:folder_architecture/core/components/widgets/slider/image_slider.dart';
import 'package:folder_architecture/core/extensions/context_extensions.dart';
import 'package:folder_architecture/core/extensions/string_extensions.dart';
import 'package:folder_architecture/core/init/lang/locale_keys.g.dart';
import 'package:folder_architecture/view/home/game/model/game_view_state.dart';
import 'package:folder_architecture/view/home/game/viewmodel/game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, GameViewModel viewModel) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(Icons.rounded_corner),
          centerTitle: true,
          title: Text(
            LocaleKeys.game_title.locale,
            style: context.textTheme.headline5!.copyWith(color: context.customColors.orange),
          ),
          actions: [
            Padding(
              padding: context.paddingLowHorizontal,
              child: const Icon(Icons.camera),
            )
          ],
        ),
        body: DefaultTabController(
          length: 5,
          child: ListView.builder(
            itemCount: GameViewItems.values.length,
            itemBuilder: (BuildContext context, int index) {
              switch (GameViewItems.values[index]) {
                case GameViewItems.SEARCH_BAR:
                  return buildPaddingSearchBar(context);
                case GameViewItems.TAB_BAR:
                  return TabBar(
                      isScrollable: true, tabs: viewModel.gameTabItems.map((e) => Tab(text: e.locale)).toList());
                case GameViewItems.SLIDER:
                  return ImageSlider();
                case GameViewItems.NEW_UPDATED_GAMES_CARD:
                  return Column(
                    children: [
                      HeaderButton(
                        title: LocaleKeys.game_newUpdate,
                        onPressed: (){},
                      ),
                      // GridView.count(crossAxisCount: crossAxisCount)
                    ],
                  );

                default:
                  return const Text('data');
              }
            },
          ),
        ),
      ),
    );
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLowAll,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.customColors.darkGrey,
                width: 0.8,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: context.customColors.darkGrey,
                width: 0.8,
              )),
        ),
      ),
    );
  }
}


