import 'dart:convert';

import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_dto.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/screens/sensor_readings.dart';
import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  late SensorSystemDTO mockSensorSystem;

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
      ),
      readingCount: 0,
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
}
