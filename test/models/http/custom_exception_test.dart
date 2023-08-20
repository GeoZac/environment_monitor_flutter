import 'package:environment_monitor/models/http/custom_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomException', () {
    test('toString() should return the formatted message', () {
      final exception = CustomException('Error message', 'Prefix: ');

      expect(exception.toString(), 'Prefix: Error message');
    });

    test('Exception properties should have correct values', () {
      final exception = CustomException('Error message', 'Prefix: ');

      expect(exception.message, 'Error message');
      expect(exception.prefix, 'Prefix: ');
    });
  });
}
