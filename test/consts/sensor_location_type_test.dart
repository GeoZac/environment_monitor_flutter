import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Verify the number of elements in the enum', () {
    // Verify the number of elements in the enum
    expect(SensorLocationType.values.length, 2);
  });

  test('Verify individual elements in the enum', () {
    // Test the individual enum values
    expect(SensorLocationType.indoor, SensorLocationType.values[0]);
    expect(SensorLocationType.outdoor, SensorLocationType.values[1]);
  });
}
