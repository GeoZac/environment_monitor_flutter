import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_dto.dart';
import 'package:environment_monitor/models/threshold/threshold.dart';
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
    final SensorSystemDTO sensorSystem = SensorSystemDTO.fromJson(json);

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

  test('Test SensorSystem.fromJson with Thresholds', () {
    // Sample JSON data
    final json = {
      "id": "7499e351-f3f7-40f0-aaee-6a5f09070848",
      "sensorName": "Workspace sensor system",
      "description": "Monitors temperature and humidity for personal workspace",
      "deleted": false,
      "sensorStatus": "ACTIVE",
      "sensorLocation": {
        "id": "9c28ce4a-144d-49bd-b303-7e9dae98ac5b",
        "sensorLocationText": "Parthenon",
        "latitude": 37.9715,
        "longitude": 23.7269,
        "sensorLocationType": "OUTDOOR"
      },
      "unconvUser": {
        "id": "b9b401a5-9509-47c1-b134-200ba288092d",
        "username": "NewUnconvUser",
        "email": "newuser@email.com",
        "authorities": [],
        "enabled": false,
        "accountNonExpired": false,
        "accountNonLocked": false,
        "credentialsNonExpired": false
      },
      "humidityThreshold": {
        "id": "a60053df-03e8-4f3a-aced-51627e85b8d3",
        "maxValue": 75.0,
        "minValue": 23.0
      },
      "temperatureThreshold": {
        "id": "eb32890a-1330-44cd-8199-11e76faa98a9",
        "maxValue": 100.0,
        "minValue": 0.0
      },
      "readingCount": 4365868485925218167,
      "latestReading": {
        "temperature": 32.1,
        "humidity": 76.5,
        "timestamp": "2024-07-13T02:13:53.444839418Z"
      },
    };

    // Perform the model mapping
    final SensorSystemDTO sensorSystem = SensorSystemDTO.fromJson(json);

    // Verify the values
    expect(sensorSystem.id, "7499e351-f3f7-40f0-aaee-6a5f09070848");
    expect(sensorSystem.sensorName, "Workspace sensor system");
    expect(sensorSystem.description,
        "Monitors temperature and humidity for personal workspace");
    expect(sensorSystem.deleted, false);
    expect(sensorSystem.sensorStatus, SensorStatus.active);
    expect(sensorSystem.sensorLocation!.id,
        "9c28ce4a-144d-49bd-b303-7e9dae98ac5b");
    expect(sensorSystem.sensorLocation!.sensorLocationText, "Parthenon");
    expect(sensorSystem.sensorLocation!.latitude, 37.9715);
    expect(sensorSystem.sensorLocation!.longitude, 23.7269);
    expect(sensorSystem.sensorLocation!.sensorLocationType,
        SensorLocationType.outdoor);
    expect(sensorSystem.unconvUser.id, "b9b401a5-9509-47c1-b134-200ba288092d");
    expect(sensorSystem.unconvUser.username, "NewUnconvUser");
    expect(sensorSystem.unconvUser.email, "newuser@email.com");
    expect(sensorSystem.humidityThreshold!.id!,
        "a60053df-03e8-4f3a-aced-51627e85b8d3");
    expect(sensorSystem.humidityThreshold!.maxValue, 75.0);
    expect(sensorSystem.humidityThreshold!.minValue, 23.0);
    expect(sensorSystem.temperatureThreshold!.id,
        "eb32890a-1330-44cd-8199-11e76faa98a9");
    expect(sensorSystem.temperatureThreshold!.maxValue, 100.0);
    expect(sensorSystem.temperatureThreshold!.minValue, 0.0);
    expect(sensorSystem.readingCount, 4365868485925218167);
    expect(sensorSystem.latestReading!.temperature, 32.1);
    expect(sensorSystem.latestReading!.humidity, 76.5);
    expect(sensorSystem.latestReading!.timestamp,
        "2024-07-13T02:13:53.444839418Z");
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
    final SensorSystemDTO sensorSystem = SensorSystemDTO.fromJson(json);

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

    expect(() => SensorSystemDTO.fromJson(json2), throwsFormatException);
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

    expect(() => SensorSystemDTO.fromJson(json), throwsArgumentError);
  }));

  test('toJson() should return a valid JSON map', () {
    // Create an instance of the class to test
    final instance = SensorSystemDTO(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
      ),
      readingCount: 0,
      humidityThreshold: Threshold(
        minValue: 25.1,
        maxValue: 75.9,
      ),
      temperatureThreshold: Threshold(
        minValue: 0.0,
        maxValue: 100.0,
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
    final instance = SensorSystemDTO(
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
      readingCount: 0,
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
    final instance = SensorSystemDTO(
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
      readingCount: 0,
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('508baef0-bc82-4481-9af8-83d2e5132100'));
    expect(json['sensorName'], equals('Test Sensor'));
    expect(json['sensorLocation'], isA<Map<String, dynamic>>());
    expect(json['sensorLocation']['sensorLocationType'], isA<String>());
    expect(json['unconvUser'], isA<Map<String, dynamic>>());
  });
}
