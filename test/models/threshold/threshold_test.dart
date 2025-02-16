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

    test('fromJson should throw FormatException when minValue is missing', () {
      final json = {
        'id': '123',
        'maxValue': 100.0,
      };

      expect(() => Threshold.fromJson(json), throwsFormatException);
    });

    test('fromJson should throw FormatException when maxValue is missing', () {
      final json = {
        'id': '123',
        'minValue': 10.0,
      };

      expect(() => Threshold.fromJson(json), throwsFormatException);
    });

    test('toJson should return a valid JSON map', () {
      final threshold = Threshold(
        id: '123',
        minValue: 10.0,
        maxValue: 100.0,
      );

      final json = threshold.toJson();

      expect(json['id'], '123');
      expect(json['minValue'], 10.0);
      expect(json['maxValue'], 100.0);
    });
  });
}
