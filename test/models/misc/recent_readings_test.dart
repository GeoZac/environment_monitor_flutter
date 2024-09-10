import 'package:environment_monitor/models/misc/recent_readings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecentReadings', () {
    test('constructor initializes fields correctly', () {
      final readings = RecentReadings(
        i1: 10,
        i3: 20,
        i8: 30,
        i24: 40,
        i168: 50,
      );

      expect(readings.i1, 10);
      expect(readings.i3, 20);
      expect(readings.i8, 30);
      expect(readings.i24, 40);
      expect(readings.i168, 50);
    });

    test('fromJson initializes fields correctly', () {
      final json = {
        '1': 10,
        '3': 20,
        '8': 30,
        '24': 40,
        '168': 50,
      };

      final readings = RecentReadings.fromJson(json);

      expect(readings.i1, 10);
      expect(readings.i3, 20);
      expect(readings.i8, 30);
      expect(readings.i24, 40);
      expect(readings.i168, 50);
    });

    test('fromJson handles missing fields', () {
      final json = {
        '1': null,
        '3': 20,
        '8': null,
        '24': 40,
        // '168' is missing
      };

      final readings = RecentReadings.fromJson(json);

      expect(readings.i1, null);
      expect(readings.i3, 20);
      expect(readings.i8, null);
      expect(readings.i24, 40);
      expect(readings.i168, null);
    });
  });
}
