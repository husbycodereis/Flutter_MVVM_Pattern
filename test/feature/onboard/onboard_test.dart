import 'package:flutter_test/flutter_test.dart';

import 'onboard_mock_view_model.dart';

// ignore: always_declare_return_types
void main() {
  late OnBoardViewMockModel mockViewMOdel;
  late IStringHelper stringHelper;
  setUp(() {
    mockViewMOdel = OnBoardViewMockModel();
    stringHelper = MockStringHelper();
    mockViewMOdel.init();
  });

  test('String Helper Upper Case', () {
    var text = 'Hello';
    text = stringHelper.toUpper(text);
    expect(text.contains(RegExp('[A-Z]')), true);
  });

  test('OnBoard Get Models', () {
    mockViewMOdel.onBoardGetModels();
    expect(mockViewMOdel.onBoardItems, isNotEmpty);
  });

  test('OnBoard Get Service Request', () {
    expect(mockViewMOdel.isLoading, false);
    mockViewMOdel.getServiceRequest();
    expect(mockViewMOdel.isLoading, true);
  });

  test('OnBoard Change Current Page', () {
    mockViewMOdel.changeCurrentIndex(3);
    expect(
      3,
      mockViewMOdel.currentPageIndex,
    );
  });

  group('Test All', () {
    var index = 0;
    test('OnBoard Get Models', () {
      mockViewMOdel.onBoardGetModels();
      index = mockViewMOdel.onBoardItems.length;
      expect(mockViewMOdel.onBoardItems, isNotEmpty);
    });

    test('OnBoard Change Current Page', () {
      mockViewMOdel.changeCurrentIndex(index);
      expect(
        index,
        mockViewMOdel.currentPageIndex,
      );
    });
  });
}
