import 'dart:convert';

import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/providers/sensor_location_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sensor_location_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('fetchSensorLocations should return a valid SensorLocation List',
      () async {
    final mockClient = MockClient();

    List<Map<String, dynamic>> jsonData = [
      {
        "id": "d3082569-2667-466e-b51a-f69d1319034e",
        "sensorLocationText": "GQI",
        "latitude": 13.436140660577678,
        "longitude": 179.7779088773541,
        "sensorLocationType": "OUTDOOR",
      },
      {
        "id": "737aa1e2-4b07-4058-8bbc-89bee8208fa9",
        "sensorLocationText": "QEEREHDMFQ",
        "latitude": -8.683114422179202,
        "longitude": -64.29258062822183,
        "sensorLocationType": "OUTDOOR",
      },
      {
        "id": "c414fa34-45a7-4626-9c6c-26188366d793",
        "sensorLocationText": "DTF",
        "latitude": -47.02522450124238,
        "longitude": 87.83869742329769,
        "sensorLocationType": "INDOOR",
      }
    ];

    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(jsonEncode(jsonData), 200));

    final SensorLocationProvider sensorLocationProvider =
        SensorLocationProvider(mockClient);

    final result = await sensorLocationProvider.fetchSensorLocations("123");

    expect(result, isA<List>());
  });

  test(
      "createSensorLocation should create a new SensorLocation with valid values",
      () async {
    final mockClient = MockClient();

    final sensorLocationData = {
      "id": "bb713d65-75a6-4b85-a638-a4a118c224aa",
      "sensorLocationText": "Moai Statues",
      "latitude": -27.1212,
      "longitude": -109.3667,
      "sensorLocationType": "OUTDOOR"
    };

    when(
      mockClient.post(any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
          encoding: anyNamed('encoding')),
    ).thenAnswer(
      (_) async => http.Response(
        jsonEncode(sensorLocationData),
        201,
      ),
    );

    final SensorLocationProvider sensorLocationProvider =
        SensorLocationProvider(mockClient);

    SensorLocation sensorLocation = SensorLocation.fromJson(sensorLocationData);
    sensorLocation.id = null;

    final result =
        await sensorLocationProvider.createSensorLocation(sensorLocation);
    expect(result, isA<SensorLocation>());
    expect(result.id, sensorLocationData['id']);
  });
}
