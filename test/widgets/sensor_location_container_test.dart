import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/widgets/sensor_location_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'SensorLocationContainer displays sensor location text when available',
      (WidgetTester tester) async {
    final sensorSystemWithLocation = SensorSystem(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      sensorLocation: SensorLocation(
        id: '508baef0-bc82-4481-9af8-83d2e5132199',
        sensorLocationText: 'Living Room',
        latitude: 0.0,
        longitude: 0.0,
        sensorLocationType: SensorLocationType.outdoor,
      ),
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorLocationContainer(sensorSystem: sensorSystemWithLocation),
        ),
      ),
    );

    expect(find.byIcon(Icons.location_on_outlined), findsOneWidget);
    expect(find.text('Living Room'), findsOneWidget);
  });

  testWidgets(
      'SensorLocationContainer does not display anything when location is null',
      (WidgetTester tester) async {
    final sensorSystemWithoutLocation = SensorSystem(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorLocationContainer(
              sensorSystem: sensorSystemWithoutLocation),
        ),
      ),
    );

    expect(find.byIcon(Icons.location_on_outlined), findsNothing);
    expect(find.text('Living Room'),
        findsNothing); // Ensure this specific text is not found
  });
}
