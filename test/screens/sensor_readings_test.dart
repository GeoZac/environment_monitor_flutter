import 'dart:convert';

import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_dto.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/screens/sensor_readings.dart';
import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:environment_monitor/widgets/sensor_reading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  late SensorSystemDTO mockSensorSystem;

  Map<String, dynamic> getMinimalMockReadingData() {
    return {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [
        {
          "id": "c4bd4221-369f-4ba8-b3d8-a7c7d6e25c10",
          "temperature": -8532.269,
          "humidity": 74.344,
          "timestamp": "2068-11-12T07:40:41.578527Z",
          "sensorSystem": {
            "id": "eacc8c6d-d16b-4a8d-ba83-47f1a2cd4846",
            "sensorName": "Specific Sensor System",
            "deleted": false,
            "sensorStatus": "ACTIVE",
            "sensorLocation": null,
            "unconvUser": {
              "id": "532c476c-0eed-4d46-97f5-e7a6eefaa2d0",
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
            "latestReading": null,
          }
        },
      ],
      "totalElements": 1,
      "pageNumber": 1,
      "totalPages": 1
    };
  }

  MockClient createMockClient({void Function()? onRequest}) {
    return MockClient((request) async {
      onRequest?.call();
      return http.Response(jsonEncode(getMinimalMockReadingData()), 200);
    });
  }

  setUp(() {
    mockSensorSystem = SensorSystemDTO(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
        accountNonExpired: true,
        accountNonLocked: true,
        credentialsNonExpired: true,
        enabled: true,
        authorities: [
          UnconvAuthority.unconvUser,
        ],
      ),
      readingCount: 0,
      createdDate: "2024-02-29T14:57:56.795247158Z",
      updatedDate: "2025-01-23T12:57:56.795270236Z",
    );
  });

  testWidgets('Displays loading spinner while data is being fetched',
      (WidgetTester tester) async {
    // Arrange
    Map<String, dynamic> jsonData = {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [],
      "totalElements": 0,
      "pageNumber": 1,
      "totalPages": 1
    };

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 200);
    });

    // Act
    await tester.pumpWidget(MaterialApp(
      home: SensorReadings(
        selectedSensor: mockSensorSystem,
        httpClient: mockClient,
      ),
    ));

    // Assert
    expect(find.byType(CenteredCircularProgress), findsOneWidget);
    expect(find.text('Sensor Readings'), findsOneWidget);
  });

  testWidgets('Displays sensor readings after data is fetched',
      (WidgetTester tester) async {
    final mockClient = createMockClient();

    // Act
    await tester.pumpWidget(MaterialApp(
      home: SensorReadings(
        selectedSensor: mockSensorSystem,
        httpClient: mockClient,
      ),
    ));

    await tester.pumpAndSettle(); // Wait for the Future to complete

    // Assert
    expect(find.byType(SensorReadingCard), findsNWidgets(1));
    expect(find.text('Test Sensor'), findsOneWidget);
  });

  testWidgets('should call fetchSensorReadings when resumed',
      (WidgetTester tester) async {
    int callCount = 0;

    final mockClient = createMockClient(onRequest: () => callCount++);

    expect(callCount, 0);

    await tester.pumpWidget(MaterialApp(
      home: SensorReadings(
        selectedSensor: mockSensorSystem,
        httpClient: mockClient,
      ),
    ));

    await tester.pumpAndSettle();

    expect(callCount, 1);

    final lifecycleEvent = AppLifecycleState.resumed;
    tester.binding.handleAppLifecycleStateChanged(lifecycleEvent);

    await tester.pumpAndSettle();

    expect(callCount, 2);
  });
}
