import 'package:environment_monitor/models/envt_reading/envt_reading.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test EnvironmentalReading.fromJson', () {
    // Sample JSON data
    final json = {
      "id": "0002d2ce-6441-4975-bdb9-a55667ebfb23",
      "temperature": 30.5,
      "humidity": 72.4,
      "timestamp": "2023-06-21T22:10:29Z",
      "sensorSystem": {
        "id": "508baef0-bc82-4481-9af8-83d2e5132100",
        "sensorName": "Test Sensor",
        "sensorLocation": null,
        "unconvUser": {
          "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
          "username": "Test User",
          "email": "noname@email.com"
        }
      }
    };

    // Perform the model mapping
    final reading = EnvironmentalReading.fromJson(json);

    // Verify the values
    expect(reading.id, "0002d2ce-6441-4975-bdb9-a55667ebfb23");
    expect(reading.temperature, 30.5);
    expect(reading.humidity, 72.4);
    expect(reading.timestamp, "2023-06-21T22:10:29Z");
    expect(reading.sensorSystem.id, "508baef0-bc82-4481-9af8-83d2e5132100");
    expect(reading.sensorSystem.sensorName, "Test Sensor");
    expect(reading.sensorSystem.unconvUser.id,
        "a5bbd1bd-c89b-4219-b0a8-379abe41b879");
    expect(reading.sensorSystem.unconvUser.username, "Test User");
    expect(reading.sensorSystem.unconvUser.email, "noname@email.com");
  });

  test("Failure", (() {
    // Test case 2: JSON missing 'id' field
    final json2 = {
      "temperature": 30.5,
      "humidity": 72.4,
      "timestamp": "2023-06-21T22:10:29Z",
      "sensorSystem": {
        "id": "508baef0-bc82-4481-9af8-83d2e5132100",
        "sensorName": "Test Sensor",
        "sensorLocation": null,
        "unconvUser": {
          "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
          "Test User": "Test User",
          "email": "test@example.com"
        }
      }
    };

    expect(() => EnvironmentalReading.fromJson(json2), throwsFormatException);
  }));

  test('toJson() should return a valid JSON map', () {
    // Create an instance of the class to test
    final instance = EnvironmentalReading(
      id: "0002d2ce-6441-4975-bdb9-a55667ebfb23",
      temperature: 25.0,
      humidity: 50.0,
      timestamp: "2023-06-21T22:10:29Z",
      sensorSystem: SensorSystem(
        id: "508baef0-bc82-4481-9af8-83d2e5132100",
        sensorName: "Test Sensor",
        unconvUser: UnconvUser(
          id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
          username: "Test User",
          email: "test@example.com",
        ),
      ),
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('0002d2ce-6441-4975-bdb9-a55667ebfb23'));
    expect(json['temperature'], equals(25.0));
    expect(json['humidity'], equals(50.0));
    expect(json['timestamp'], isNotNull);
    expect(json['sensorSystem'], isA<Map<String, dynamic>>());
  });
}
