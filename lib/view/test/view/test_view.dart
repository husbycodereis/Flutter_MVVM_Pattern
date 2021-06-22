import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  final StreamController streamController = StreamController();
  late TestViewModel _testViewModel;

  addData() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      streamController.sink.add(i);
    }
  }

  Stream<int> numberStream() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      streamController.sink.add(i);
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        _testViewModel = model;
        addData();
      },
      onDispose: () {
        streamController.close();
      },
      onPageBuilder: (context, value) => buildScaffoldBody,
    );
  }

  Widget get buildScaffoldBody => Scaffold(
        appBar: AppBar(
          title: Text('Test Widget'),
        ),
        floatingActionButton: buildFloatingActionButton,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              buildText,
              SizedBox(
                height: 20,
              ),
              mailField,
              SizedBox(
                height: 20,
              ),
              Row(
                children: [textWelcomeWidget(), iconButtonChangeTheme(context)],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: dynamicWidth(0.8),
                color: Colors.transparent,
                child: StreamBuilder(
                  stream: numberStream()
                      .map((number) => 'stream number is $number'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text('anasini siktin');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Text(snapshot.data);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonChangeTheme(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.brightness_5),
        onPressed: () {
          _testViewModel.changeTheme();
        });
  }

  FloatingActionButton get buildFloatingActionButton {
    return FloatingActionButton(
        onPressed: () => _testViewModel.incrementCounter());
  }

  Widget get buildText => Observer(builder: (_) {
        return Text('viewmodeal counter data is ${_testViewModel.counter}');
      });
}

extension _FormArea on _TestViewState {
  TextFormField get mailField =>
      TextFormField(validator: (value) => value!.isValidEmail);
}
