import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/envt_reading/base_envt_reading.dart';
import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_dto.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/screens/sensor_readings.dart';
import 'package:environment_monitor/widgets/dashboard_sensor_card.dart';
import 'package:environment_monitor/widgets/sensor_location_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'SensorSystemDashboardCard displays sensor name and reading count',
      (WidgetTester tester) async {
    final sensorSystem = SensorSystemDTO(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: true,
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
      readingCount: 5,
      createdDate: "2024-02-29T14:57:56.795247158Z",
      updatedDate: "2025-01-23T12:57:56.795270236Z",
    );

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorSystemDashboardCard(sensorSystem: sensorSystem),
        ),
      ),
    );

    // Assert
    expect(find.text('Test Sensor'), findsOneWidget);
    expect(find.text('Reading Count : 5'), findsOneWidget);
    expect(find.byType(SensorLocationContainer),
        findsNothing); // No location displayed
    expect(find.text('Latest reading'),
        findsNothing); // No latest reading displayed
  });

  testWidgets(
      'SensorSystemDashboardCard displays location and latest reading when available',
      (WidgetTester tester) async {
    // Arrange
    final sensorSystem = SensorSystemDTO(
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
          accountNonExpired: true,
          accountNonLocked: true,
          credentialsNonExpired: true,
          enabled: true,
          authorities: [
            UnconvAuthority.unconvUser,
          ],
        ),
        readingCount: 10,
        createdDate: "2024-02-29T14:57:56.795247158Z",
        updatedDate: "2025-01-23T12:57:56.795270236Z",
        latestReading: BaseEnvironmentalReading(
          temperature: 25.00,
          humidity: 60.00,
          timestamp: "2023-06-21T22:10:29Z",
        ));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorSystemDashboardCard(sensorSystem: sensorSystem),
        ),
      ),
    );

    expect(find.text('Test Sensor'), findsOneWidget);
    expect(find.text('Reading Count : 10'), findsOneWidget);
    expect(find.byType(SensorLocationContainer), findsOneWidget);
    expect(find.text('Latest reading'), findsOneWidget);
  });

  testWidgets(
      'SensorSystemDashboardCard navigates to SensorReadings when arrow button pressed',
      (WidgetTester tester) async {
    final sensorSystem = SensorSystemDTO(
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

    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Scaffold(
                body: SensorSystemDashboardCard(sensorSystem: sensorSystem),
              ),
          SensorReadings.routeName: (context) => Container(),
        },
      ),
    );

    await tester.tap(find.byIcon(Icons.arrow_right));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });
}
