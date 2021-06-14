import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:folder_architecture/core/constants/app/app_constants.dart';
import 'package:folder_architecture/core/init/cache/local_manager.dart';
import 'package:folder_architecture/core/init/lang/language_manager.dart';
import 'package:folder_architecture/core/init/navigation/navigation_routes.dart';
import 'package:folder_architecture/core/init/navigation/navigation_service.dart';
import 'package:folder_architecture/core/init/notifier/provider_list.dart';
import 'package:folder_architecture/core/init/notifier/theme_notifier.dart';
import 'package:folder_architecture/view/test/view/test_view.dart';
import 'package:provider/provider.dart';

void main() {
  _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance!.supportedLocales,
      path: ApplicationConstants.LANG_ASSETS_PATH,
      startLocale: LanguageManager.instance!.enLocale,
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: TestWiew(),
      ),
    );
  }
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
}
