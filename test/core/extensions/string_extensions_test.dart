import 'package:flutter_test/flutter_test.dart';
import 'package:folder_architecture/core/extensions/string_extensions.dart';

// ignore: always_declare_return_types
main() {
  setUp(() {});

  test('String Tests', () {
    var email = 'adams@gmail.com';
    expect(email.isValidEmail, null);
  });
}
