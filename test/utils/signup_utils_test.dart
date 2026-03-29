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

  group('isValidPassword', () {
    test('fails when length is less than 6', () {
      expect(isValidPassword('Aa1!'), false);
    });

    test('fails when length is greater than 25', () {
      expect(isValidPassword('Aa1!aaaaaaaaaaaaaaaaaaaaaaa'), false);
    });

    test('fails when missing uppercase letter', () {
      expect(isValidPassword('aa1!aa'), false);
    });

    test('fails when missing lowercase letter', () {
      expect(isValidPassword('AA1!AA'), false);
    });

    test('fails when missing digit', () {
      expect(isValidPassword('Aa!aaa'), false);
    });

    test('fails when missing special character', () {
      expect(isValidPassword('Aa1aaa'), false);
    });

    test('fails when whitespace is present', () {
      expect(isValidPassword('Aa1! aa'), false);
    });

    test('passes for valid password (minimum boundary)', () {
      expect(isValidPassword('Aa1!aa'), true);
    });

    test('passes for valid password (maximum boundary)', () {
      expect(isValidPassword('Aa1!aaaaaaaaaaaaaaaaaaaa'), true);
    });

    test('passes for typical valid password', () {
      expect(isValidPassword('StrongP@ss1'), true);
    });

    test('passes with multiple special characters', () {
      expect(isValidPassword('Aa1!@#\$'), true);
    });

    test('fails when only one rule is violated (no digit)', () {
      expect(isValidPassword('Aa!aaaa'), false);
    });
  });
}
