import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:folder_architecture/core/extensions/context_extensions.dart';
import 'package:folder_architecture/core/extensions/string_extensions.dart';
import 'package:folder_architecture/core/init/lang/locale_keys.g.dart';
import 'package:folder_architecture/view/_product/_widgets/list-tile/friends_card.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/social_view_model.dart';

class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SoicalViewModel>(
      viewModel: SoicalViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SoicalViewModel viewModel) => Scaffold(
        appBar: buildAppBar(context, viewModel),
        body: Padding(
          padding: context.paddingLowAll * 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFindFriends(context),
              const Spacer(
                flex: 2,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: context.lowValue * 0.5),
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.colors.onSecondary.withOpacity(0.4),
                  ),
                  filled: true,
                  fillColor: context.customColors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 0.8,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        width: 0.3,
                      )),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 90,
                child: Observer(builder: (_) {
                  return buildListView(viewModel);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, SoicalViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 70,
      leading: TextButton(
        onPressed: () {
          viewModel.fetchAllUsers();
        },
        child: Text(
          LocaleKeys.social_cancel.locale,
          style: context.textTheme.subtitle2,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            LocaleKeys.social_next.locale,
            style: TextStyle(color: context.colors.primary),
          ),
        )
      ],
    );
  }

  Text buildTextFindFriends(BuildContext context) {
    return Text(
      LocaleKeys.social_findFriends.locale,
      style: context.textTheme.headline2!.copyWith(color: context.customColors.black, fontWeight: FontWeight.w600),
    );
  }

  ListView buildListView(SoicalViewModel viewModel) {
    return ListView.separated(
      itemCount: viewModel.socialUserList.length,
      itemBuilder: (BuildContext context, int index) {
        return FriendsCard(
          user: viewModel.socialUserList[index],
          onPressed: () {},
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
