import 'package:flutter_test/flutter_test.dart';

import 'onboard_mock_view_model.dart';

main() {
  late OnBoardViewMockModel mockViewMOdel;
  late IStringHelper stringHelper;
  setUp(() {
    mockViewMOdel = OnBoardViewMockModel();
    stringHelper = MockStringHelper();
    mockViewMOdel.init();
  });

  test('String Helper Upper Case', () {
    String text = 'Hello';
    text = stringHelper.toUpper(text);
    expect(text.contains(RegExp(r'[A-Z]')), true);
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
    int index = 0;
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
