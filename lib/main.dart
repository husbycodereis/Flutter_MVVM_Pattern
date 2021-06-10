import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:folder_architecture/core/constants/app/app_constants.dart';
import 'package:folder_architecture/core/init/cache/local_manager.dart';
import 'package:folder_architecture/core/init/lang/language_manager.dart';
import 'package:folder_architecture/core/init/navigation/navigation_routes.dart';
import 'package:folder_architecture/core/init/navigation/navigation_service.dart';
import 'package:folder_architecture/core/init/notifier/provider_list.dart';
import 'package:folder_architecture/core/init/notifier/theme_notifier.dart';
import 'package:folder_architecture/view/test/view/test_widget.dart';
import 'package:provider/provider.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: TestWidget(),
    );
  }
}
