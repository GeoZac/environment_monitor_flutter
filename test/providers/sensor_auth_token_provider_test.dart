import 'dart:convert';

import 'package:environment_monitor/models/sensor_auth_token/sensor_auth_token.dart';
import 'package:environment_monitor/providers/sensor_auth_token_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'sensor_auth_token_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test(
      'fetchSensorAuthToken should return a valid SensorAuthToken for a valid SensorAuthToken',
      () async {
    final mockClient = MockClient();

    String sensorSystemId = "9ce6ac10-0ac6-409c-82fd-0413b148d4a9";

    Map<String, dynamic> jsonData = {
      "id": "92d16130-933c-45a1-8d3d-c59e211c99e4",
      "authToken": "UNCONVLoYrAxigZRuSafgZejdpRQy/UYCt1R4nzPOZd7RnA==",
      "expiry": "2024-05-26T09:05:52.6295959Z",
      "sensorSystem": {
        "id": sensorSystemId,
        "sensorName": "Test sensor",
        "description": null,
        "deleted": false,
        "sensorStatus": "ACTIVE",
        "sensorLocation": null,
        "unconvUser": {
          "id": "fca88312-bc2a-45bb-bf6f-750a473c5de0",
          "username": "UnconvUser",
          "email": "unconvuser@email.com"
        },
        "humidityThreshold": null,
        "temperatureThreshold": null
      }
    };

    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(jsonEncode(jsonData), 200));

    final SensorAuthTokenProvider sensorAuthTokenProvider =
        SensorAuthTokenProvider(mockClient);

    final result =
        await sensorAuthTokenProvider.fetchSensorAuthToken(sensorSystemId);

    // Verify the result
    expect(result, isA<SensorAuthToken>());
    expect(result?.sensorSystem.id, sensorSystemId);
  });
}
