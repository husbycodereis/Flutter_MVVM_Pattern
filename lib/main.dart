import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/constants/enums/locale_keys_enum.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_routes.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/on_board_notifier.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'view/authentication/login/view/login_view.dart';
import 'view/authentication/onboard/view/on_board_view.dart';
import 'view/home/home_view.dart';

Future main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance!.dependItems],
    child: EasyLocalization(
      supportedLocales: LanguageManager.instance!.supportedLocales,
      path: ApplicationConstants.LANG_ASSETS_PATH,
      startLocale: LanguageManager.instance!.enLocale,
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier, OnBoardAndLoginNotifier>(
      builder: (context, themeNotifier, onBoardandLoginNotifier, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Boilerplate Application',
        theme: context.watch<ThemeNotifier>().currentTheme,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: onBoardandLoginNotifier.isOnBoardViewed
            ? onBoardandLoginNotifier.isLoggedIn
                ? const HomeView()
                : const LoginView()
            : const OnBoardView(),
      ),
    );
  }

  bool get isOnbardViewed => LocaleManager.instance.getBoolValue(SharedPrefKeys.IS_FIRST_LOAD);
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
}
