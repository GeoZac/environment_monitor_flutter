import 'dart:convert';

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
}
