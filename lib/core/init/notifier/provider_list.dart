import 'package:folder_architecture/core/init/navigation/navigation_service.dart';
import 'package:folder_architecture/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider? get instance {
     _instance ??= ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();
  //for proxy items such as proxyprovder or streamprovider
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    Provider.value(value: NavigationService.instance)
  ];

  List<SingleChildWidget> uiChangeItems = [];

  List<SingleChildWidget> singleItems = [];
}
