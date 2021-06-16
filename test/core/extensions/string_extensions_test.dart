import 'package:flutter_test/flutter_test.dart';
import 'package:folder_architecture/core/extensions/string_extensions.dart';

main() {
  setUp(() {});

  test('String Tests', () {
    String email = 'adams@gmail.com';
    expect(email.isValidEmail, null);
  });
}
