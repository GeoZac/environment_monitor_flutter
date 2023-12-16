import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test SensorSystem.fromJson with SensorLocation', () {
    // Sample JSON data
    final json = {
      "id": "508baef0-bc82-4481-9af8-83d2e5132100",
      "sensorName": "Test Sensor",
      "description": "Custom sensor for workspace",
      "deleted": false,
      "sensorStatus": "ACTIVE",
      "sensorLocation": {
        "id": "a9ea45e2-71c0-4493-8680-5d1282acfe82",
        "sensorLocationText": "Some Place",
        "latitude": 18.499733,
        "longitude": 56.9241666,
        "sensorLocationType": "OUTDOOR",
      },
      "unconvUser": {
        "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        "username": "Test User",
        "email": "noname@email.com",
      },
      "readingCount": 0,
      "latestReading": null,
    };

    // Perform the model mapping
    final SensorSystem sensorSystem = SensorSystem.fromJson(json);

    // Verify the values
    expect(sensorSystem.id, "508baef0-bc82-4481-9af8-83d2e5132100");
    expect(sensorSystem.sensorName, "Test Sensor");
    expect(sensorSystem.description, "Custom sensor for workspace");
    expect(sensorSystem.deleted, false);
    expect(sensorSystem.sensorStatus, SensorStatus.active);
    expect(sensorSystem.sensorLocation!.id,
        'a9ea45e2-71c0-4493-8680-5d1282acfe82');
    expect(sensorSystem.sensorLocation!.sensorLocationType,
        SensorLocationType.outdoor);
    expect(sensorSystem.unconvUser.id, "a5bbd1bd-c89b-4219-b0a8-379abe41b879");
    expect(sensorSystem.unconvUser.username, "Test User");
    expect(sensorSystem.unconvUser.email, "noname@email.com");
  });

  test('Test SensorSystem.fromJson', () {
    // Sample JSON data
    final json = {
      "id": "508baef0-bc82-4481-9af8-83d2e5132100",
      "sensorName": "Test Sensor",
      "deleted": false,
      "sensorStatus": "ACTIVE",
      "sensorLocation": null,
      "unconvUser": {
        "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        "username": "Test User",
        "email": "noname@email.com",
      },
      "readingCount": 0,
      "latestReading": null,
    };

    // Perform the model mapping
    final SensorSystem sensorSystem = SensorSystem.fromJson(json);

    // Verify the values
    expect(sensorSystem.id, "508baef0-bc82-4481-9af8-83d2e5132100");
    expect(sensorSystem.sensorName, "Test Sensor");
    expect(sensorSystem.sensorLocation, null);
    expect(sensorSystem.unconvUser.id, "a5bbd1bd-c89b-4219-b0a8-379abe41b879");
    expect(sensorSystem.unconvUser.username, "Test User");
    expect(sensorSystem.unconvUser.email, "noname@email.com");
  });

  test("Failure", (() {
    // Test case 2: JSON missing 'id' field
    final json2 = {
      "sensorName": "Test Sensor",
      "deleted": false,
      "sensorStatus": "ACTIVE",
      "sensorLocation": null,
      "unconvUser": {
        "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        "username": "Test User",
        "email": "noname@email.com",
      }
    };

    expect(() => SensorSystem.fromJson(json2), throwsFormatException);
  }));

  test("Throw ArgumentError when Sensor Status is invalid", (() {
    final json = {
      "id": "508baef0-bc82-4481-9af8-83d2e5132100",
      "sensorName": "Test Sensor",
      "deleted": false,
      "sensorStatus": "UNSPECIFIED",
      "sensorLocation": null,
      "unconvUser": {
        "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        "username": "Test User",
        "email": "noname@email.com",
      },
      "readingCount": 0,
      "latestReading": null,
    };

    expect(() => SensorSystem.fromJson(json), throwsArgumentError);
  }));

  test('toJson() should return a valid JSON map', () {
    // Create an instance of the class to test
    final instance = SensorSystem(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
      ),
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('508baef0-bc82-4481-9af8-83d2e5132100'));
    expect(json['sensorName'], equals('Test Sensor'));
    expect(json['unconvUser'], isA<Map<String, dynamic>>());
  });

  test('toJson() should return a valid JSON map with SensorLocation present',
      () {
    // Create an instance of the class to test
    final instance = SensorSystem(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: true,
      sensorStatus: SensorStatus.active,
      sensorLocation: SensorLocation(
        id: '508baef0-bc82-4481-9af8-83d2e5132199',
        sensorLocationText: 'Good Place',
        latitude: 0.0,
        longitude: 0.0,
        sensorLocationType: SensorLocationType.outdoor,
      ),
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
      ),
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('508baef0-bc82-4481-9af8-83d2e5132100'));
    expect(json['sensorName'], equals('Test Sensor'));
    expect(json['deleted'], equals(true));
    expect(json['sensorStatus'], equals("ACTIVE"));
    expect(json['sensorLocation'], isA<Map<String, dynamic>>());
    expect(json['sensorLocation']['sensorLocationType'], isA<String>());
    expect(json['unconvUser'], isA<Map<String, dynamic>>());
  });

  test('toJson() should return a valid JSON map with SensorLocation present',
      () {
    // Create an instance of the class to test
    final instance = SensorSystem(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      sensorLocation: SensorLocation(
        id: '508baef0-bc82-4481-9af8-83d2e5132199',
        sensorLocationText: 'Good Place',
        latitude: 0.0,
        longitude: 0.0,
        sensorLocationType: SensorLocationType.outdoor,
      ),
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
      ),
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('508baef0-bc82-4481-9af8-83d2e5132100'));
    expect(json['sensorName'], equals('Test Sensor'));
    expect(json['sensorStatus'], equals('ACTIVE'));
    expect(json['deleted'], equals(false));
    expect(json['sensorLocation'], isA<Map<String, dynamic>>());
    expect(json['sensorLocation']['sensorLocationType'], isA<String>());
    expect(json['unconvUser'], isA<Map<String, dynamic>>());
  });
}
