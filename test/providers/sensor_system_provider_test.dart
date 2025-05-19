import 'dart:convert';

import 'package:environment_monitor/models/misc/recent_readings.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_response.dart';
import 'package:environment_monitor/providers/sensor_system_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sensor_system_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('fetchSensorSystems should return a valid SensorSystemResponse',
      () async {
    final mockClient = MockClient();

    Map<String, dynamic> jsonData = {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [
        {
          "id": "2d1f53b1-a177-484c-a323-a3cd91134fb8",
          "sensorName": "EFBMOVZ",
          "deleted": false,
          "sensorStatus": "ACTIVE",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 0,
          "latestReading": null,
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
        {
          "id": "b7a30f45-fa48-4cff-b111-a2931d270809",
          "sensorName": "FCT",
          "deleted": false,
          "sensorStatus": "ACTIVE",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 0,
          "latestReading": null,
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
      ],
      "totalElements": 5,
      "pageNumber": 1,
      "totalPages": 1
    };

    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(jsonEncode(jsonData), 200));

    final SensorSystemProvider sensorSystemProvider =
        SensorSystemProvider(mockClient);

    // Call the method you want to test
    final result = await sensorSystemProvider.fetchSensorSystems('123');

    // Verify the result
    expect(result, isA<SensorSystemResponse>());
    expect(result.totalElements, jsonData['totalElements']);
  });

  test('fetchSensorSystems should return a valid SensorSystemResponse',
      () async {
    final mockClient = MockClient();

    Map<String, dynamic> jsonData = {
      "1": 0,
      "3": 4,
      "8": 23,
      "24": 40,
      "168": 64
    };

    when(mockClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(jsonEncode(jsonData), 200));

    final SensorSystemProvider sensorSystemProvider =
        SensorSystemProvider(mockClient);

    final result = await sensorSystemProvider.fetchRecentReadings('123');

    expect(result, isA<RecentReadings>());
    expect(result.i1, jsonData['1']);
    expect(result.i168, jsonData['168']);
  });

  test("createSensorSystem should create a new SensorSystem with valid values",
      () async {
    final mockClient = MockClient();

    final sensorSystemData = {
      "id": "2d1f53b1-a177-484c-a323-a3cd91134fb8",
      "sensorName": "EFBMOVZ",
      "description": null,
      "deleted": false,
      "sensorStatus": "ACTIVE",
      "sensorLocation": {
        "id": "815594e6-3e71-425d-8b0c-32c0f02c7361",
        "sensorLocationText": "Parthenon",
        "latitude": 37.9715,
        "longitude": 23.7269,
        "sensorLocationType": "OUTDOOR"
      },
      "unconvUser": {
        "id": "1b671fc4-8249-48f1-843a-15534438ae60",
        "username": "UnconvUser",
        "email": "unconvuser@email.com",
        "accountNonExpired": true,
        "accountNonLocked": true,
        "credentialsNonExpired": true,
        "enabled": true,
        "authorities": [
          {'authority': 'UNCONV_USER'},
        ],
      },
      "readingCount": 0,
      "latestReading": null
    };

    final jsonData = {
      "message": "Record added successfully",
      "entity": sensorSystemData,
    };

    when(
      mockClient.post(any,
          headers: anyNamed('headers'),
          body: anyNamed('body'),
          encoding: anyNamed('encoding')),
    ).thenAnswer(
      (_) async => http.Response(
        jsonEncode(jsonData),
        201,
      ),
    );

    final SensorSystemProvider sensorSystemProvider =
        SensorSystemProvider(mockClient);

    SensorSystem sensorSystem = SensorSystem.fromJson(sensorSystemData);
    sensorSystem.id = null;

    // Call the method you want to test
    final result = await sensorSystemProvider.createSensorSystem(sensorSystem);

    expect(result, isA<SensorSystem>());
    expect(result.id, sensorSystemData['id']);
    expect(result.sensorName, sensorSystemData['sensorName']);
  });
}
