import 'package:environment_monitor/utils/signup_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isValidUsername', () {
    test('returns false when value is null', () {
      expect(isValidUsername(null), false);
    });

    test('returns false when length is less than 6', () {
      expect(isValidUsername('Abc1'), false);
    });

    test('returns false when length is greater than 25', () {
      expect(isValidUsername('Aabcdefghijklmnopqrstuvwxy'), false);
    });

    test('returns false when no uppercase letter exists', () {
      expect(isValidUsername('abcdefg'), false);
    });

    test('returns false when whitespace is present', () {
      expect(isValidUsername('Abc def'), false);
    });

    test('returns true for valid username (min boundary)', () {
      expect(isValidUsername('Abcdef'), true);
    });

    test('returns true for valid username (max boundary)', () {
      expect(isValidUsername('Abcdefghijklmnopqrstuvwxy'), true);
    });

    test('returns true for typical valid username', () {
      expect(isValidUsername('UserName123'), true);
    });

    test('returns true when special characters are present (allowed)', () {
      expect(isValidUsername('User_Name'), true);
    });
  });
}
