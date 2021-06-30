import 'package:flutter_test/flutter_test.dart';
import 'package:folder_architecture/core/extensions/string_extensions.dart';


void main() {
  setUp(() {});

  test('String Tests', () {
    const email = 'adams@gmail.com';
    expect(email.isValidEmail, null);
  });
}
