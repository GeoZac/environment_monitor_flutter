import 'dart:convert';

import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/screens/dashboard.dart';
import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:environment_monitor/widgets/dashboard_sensor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  late UnconvUser unconvUser;

  setUp(() {
    unconvUser = UnconvUser(
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
    );
  });

  Map<String, dynamic> getMinimalMockSensorData() {
    return {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [
        {
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
      "totalElements": 1,
      "pageNumber": 1,
      "totalPages": 1
    };
  }

  MockClient createMockClient({void Function()? onRequest}) {
    return MockClient((request) async {
      onRequest?.call();
      return http.Response(jsonEncode(getMinimalMockSensorData()), 200);
    });
  }

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
      return http.Response(
        jsonEncode(jsonData),
        200,
      );
    });

    // Act
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(
        httpClient: mockClient,
        unconvUser: unconvUser,
      ),
    ));

    // Assert
    expect(find.byType(CenteredCircularProgress), findsOneWidget);
    expect(find.text('Environment Monitor'), findsOneWidget);
  });

  testWidgets('Displays sensor readings after data is fetched',
      (WidgetTester tester) async {
    final mockClient = createMockClient();

    await tester.pumpWidget(MaterialApp(
      home: Dashboard(
        httpClient: mockClient,
        unconvUser: unconvUser,
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.byType(SensorSystemDashboardCard), findsNWidgets(1));
    expect(find.text('Test Sensor'), findsOneWidget);
  });

  testWidgets('should call fetchAllSensorSystems when resumed',
      (WidgetTester tester) async {
    int callCount = 0;
    final mockClient = createMockClient(onRequest: () => callCount++);

    expect(callCount, 0);

    await tester.pumpWidget(MaterialApp(
      home: Dashboard(
        httpClient: mockClient,
        unconvUser: unconvUser,
      ),
    ));

    await tester.pumpAndSettle();

    expect(callCount, 1);

    final lifecycleEvent = AppLifecycleState.resumed;
    tester.binding.handleAppLifecycleStateChanged(lifecycleEvent);

    await tester.pumpAndSettle();

    expect(callCount, 2);
  });

  testWidgets('Displays sensor readings after data is fetched',
      (WidgetTester tester) async {
    // Arrange
    Map<String, dynamic> jsonData = {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [
        {
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
        }
      ],
      "totalElements": 4,
      "pageNumber": 1,
      "totalPages": 1
    };

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 200);
    });

    // Act
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(
        httpClient: mockClient,
        unconvUser: unconvUser,
      ),
    ));

    await tester.pumpAndSettle(); // Wait for the Future to complete

    // Assert

    expect(
        find.byType(
          SensorSystemDashboardCard,
          skipOffstage: true,
        ),
        findsAtLeastNWidgets(2));

    expect(
        find.byType(
          SensorSystemDashboardCard,
          skipOffstage: false,
        ),
        findsNWidgets(4));
  });
}
