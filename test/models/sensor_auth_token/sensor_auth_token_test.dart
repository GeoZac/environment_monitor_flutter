import 'package:environment_monitor/models/sensor_auth_token/sensor_auth_token.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Parse SensorAuthToken JSON to Object', () {
    final json = {
      "id": "d3128132-6e43-4837-b536-7c2baef42118",
      "authToken": "UNCONVGt1ihXH4pJXjt5cjhmv",
      "expiry": "2024-04-23T14:48:34.0982243Z",
      "sensorSystem": {
        "id": "e14a2750-b1e8-4c46-9d91-f2b80f9b80f7",
        "sensorName": "Workspace sensor system",
        "description":
            "Monitors temperature and humidity for personal workspace",
        "deleted": false,
        "sensorStatus": "ACTIVE",
        "sensorLocation": {
          "id": "5ebb3db6-e444-4440-be60-6a836e89ce0c",
          "sensorLocationText": "Parthenon",
          "latitude": 37.9715,
          "longitude": 23.7269,
          "sensorLocationType": "OUTDOOR"
        },
        "unconvUser": {
          "id": "73495fe7-0306-41e5-a09c-122b7939b7aa",
          "username": "NewUnconvUser",
          "email": "newuser@email.com",
          "authorities": [],
          "enabled": false,
          "accountNonLocked": false,
          "credentialsNonExpired": false,
          "accountNonExpired": false
        },
        "humidityThreshold": {
          "id": "774013f7-d45d-426f-8862-75e3821147f6",
          "maxValue": 75.0,
          "minValue": 23.0
        },
        "temperatureThreshold": {
          "id": "891aa116-6da4-475e-b670-bde7c8bcfd7e",
          "maxValue": 100.0,
          "minValue": 0.0
        }
      }
    };

    final SensorAuthToken sensorAuthToken = SensorAuthToken.fromJson(json);

    // Verify the values
    expect(sensorAuthToken.id, "d3128132-6e43-4837-b536-7c2baef42118");
    expect(sensorAuthToken.authToken, "UNCONVGt1ihXH4pJXjt5cjhmv");
    expect(sensorAuthToken.expiry, "2024-04-23T14:48:34.0982243Z");
    expect(sensorAuthToken.sensorSystem, isNotNull);
    expect(sensorAuthToken.sensorSystem.id,
        "e14a2750-b1e8-4c46-9d91-f2b80f9b80f7");
  });
}
