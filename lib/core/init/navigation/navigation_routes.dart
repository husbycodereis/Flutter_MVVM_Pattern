import 'package:flutter/material.dart';

import '../../../view/authentication/login/view/login_view.dart';
import '../../../view/test/view/test_view.dart';
import '../../components/cards/not_found_navigation.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView());

      default:
        return normalNavigate(NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
