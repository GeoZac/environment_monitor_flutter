import 'package:environment_monitor/models/sensor_system/sensor_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test SensorSystem.fromJson', () {
    // Sample JSON data
    final json = {
      "id": "508baef0-bc82-4481-9af8-83d2e5132100",
      "sensorName": "Test Sensor",
      "sensorLocation": null,
      "unconvUser": {
        "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        "username": "Test User",
        "email": "noname@email.com"
      }
    };

    // Perform the model mapping
    final SensorSystem sensorSystem = SensorSystem.fromJson(json);

    // Verify the values
    expect(sensorSystem.id, "508baef0-bc82-4481-9af8-83d2e5132100");
    expect(sensorSystem.sensorName, "Test Sensor");
    expect(sensorSystem.unconvUser!.id, "a5bbd1bd-c89b-4219-b0a8-379abe41b879");
    expect(sensorSystem.unconvUser!.username, "Test User");
    expect(sensorSystem.unconvUser!.email, "noname@email.com");
  });

  test("Failure", (() {
    // Test case 2: JSON missing 'id' field
    final json2 = {
      "sensorName": "Test Sensor",
      "sensorLocation": null,
      "unconvUser": {
        "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        "username": "Test User",
        "email": "noname@email.com"
      }
    };

    expect(() => SensorSystem.fromJson(json2), throwsFormatException);
  }));
}
