import 'package:flutter/material.dart';
import 'package:folder_architecture/core/base/view/base_view.dart';
import 'package:folder_architecture/core/constants/enums/lottie_path_enum.dart';
import 'package:folder_architecture/core/extensions/context_extensions.dart';
import 'package:folder_architecture/core/extensions/string_extensions.dart';
import 'package:folder_architecture/core/extensions/widget_extensions.dart';
import 'package:folder_architecture/core/init/lang/locale_keys.g.dart';
import 'package:folder_architecture/core/init/notifier/theme_notifier.dart';
import 'package:folder_architecture/core/init/theme/light/app_theme_light.dart';
import 'package:folder_architecture/view/settings/viewmodel/settings_view_model.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SettingsViewModel viewModel) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  buildSliverAppBar(context),
                  buildCardUser(context, viewModel).toSliver,
                  context.sizedBoxLowVertical.toSliver,
                  buildCardHeader(context, viewModel, title: 'absdf', children: [
                    ListTile(
                      title: Text(LocaleKeys.setting_core_themeTitle.locale),
                      trailing: IconButton(
                          onPressed: viewModel.changeAppTheme,
                          icon: context.watch<ThemeNotifier>().currentTheme == AppThemeLight.instance.theme
                              ? LottiePathEnum.SUN.toWidget
                              : LottiePathEnum.MOON.toWidget),
                      subtitle: Text(LocaleKeys.setting_core_themeDes.locale),
                    )
                  ]).toSliver,
                  buildCardAbout(context, viewModel).toSliver,
                ],
              ),
            ));
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel,
      {required String title, required List<Widget> children}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.paddingLowAll,
            child: Text(
              title,
              style: context.textTheme.headline5,
            ),
          ),
          const Divider(),
          ...children
        ],
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel, title: LocaleKeys.setting_about_title.locale, children: [
      ListTile(
        onTap: viewModel.navigateToContribution,
        leading: const Icon(Icons.favorite),
        title: Text(LocaleKeys.setting_about_contributions.locale),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      ),
      ListTile(
        onTap: viewModel.navigateToFakeContribution,
        leading: const Icon(Icons.home),
        title: Text(LocaleKeys.setting_about_home.locale),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      )
    ]);
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: SizedBox(
        height: context.dynamicHeight(0.1),
        child: Row(
          children: [
            Padding(
              padding: context.paddingLowAll,
              child: CircleAvatar(
                child: Text(viewModel.userModel.shortName),
              ),
            ),
            SizedBox(
              width: context.lowValue,
            ),
            Text(viewModel.userModel.fullName)
          ],
        ),
      ),
    );
  }

  //alternative method for creating a sliver
  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      body: const Text('hello'),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [buildSliverAppBar(context)];
      },
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      elevation: 0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          title: Text(
            LocaleKeys.setting_title.locale,
            style: context.textTheme.headline5,
          )),
    );
  }
}
