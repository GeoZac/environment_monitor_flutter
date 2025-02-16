import 'package:environment_monitor/models/threshold/threshold.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Threshold', () {
    test('fromJson should create a valid Threshold object', () {
      final json = {
        'id': '123',
        'minValue': 10.0,
        'maxValue': 100.0,
      };

      final threshold = Threshold.fromJson(json);

      expect(threshold.id, '123');
      expect(threshold.minValue, 10.0);
      expect(threshold.maxValue, 100.0);
    });
  });
}
