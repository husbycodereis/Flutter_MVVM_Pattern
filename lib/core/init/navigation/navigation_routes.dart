import 'package:flutter/material.dart';
import 'package:folder_architecture/core/components/cards/not_found_navigation.dart';
import 'package:folder_architecture/core/constants/navigation/navigation_constants.dart';
import 'package:folder_architecture/view/test/view/test_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestWiew());

      default:
        return normalNavigate(NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

