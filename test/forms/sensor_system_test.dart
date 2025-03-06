import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:environment_monitor/forms/sensor_system.dart';
import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<SensorLocation> existingLocations;
  late UnconvUser testUser;

  setUp(() {
    existingLocations = [
      SensorLocation(
        id: "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe",
        sensorLocationText: "Place A",
        latitude: 18.499733,
        longitude: 56.9241666,
        sensorLocationType: SensorLocationType.outdoor,
      ),
      SensorLocation(
        id: "a45f79ce-2b9e-4cd4-b4e7-32acbbbeded5",
        sensorLocationText: "Place B",
        latitude: 28.499733,
        longitude: 46.9241666,
        sensorLocationType: SensorLocationType.indoor,
      ),
    ];

    testUser = UnconvUser(
      id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
      username: "Test User",
      email: "test@example.com",
    );
  });

  testWidgets('SensorSystemForm initializes correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorSystemForm(
            existingSensorLocations: existingLocations,
            unconvUser: testUser,
            onSubmit: (sensorSystem) {},
          ),
        ),
      ),
    );

    // Verify initial state
    expect(find.byKey(const Key('sensorNameField')), findsOneWidget);
    expect(find.byKey(const Key('descriptionField')), findsOneWidget);

    expect(find.byKey(const Key('sensorLocationField')), findsOneWidget);

    expect(find.byKey(const Key('humidityLimitsColumn')), findsOneWidget);
    expect(find.byKey(const Key('temperatureLimitsColumn')), findsOneWidget);
  });

  testWidgets('SensorSystemForm validates and shows error on empty input',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorSystemForm(
            existingSensorLocations: existingLocations,
            unconvUser: testUser,
            onSubmit: (sensorSystem) {},
          ),
        ),
      ),
    );

    // Attempt submission without filling in required fields
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Expect validation error
    expect(find.text('Please enter a sensor name'), findsOneWidget);
  });

  testWidgets(
      'SensorSystemForm validates and submits correctly with required fields',
      (WidgetTester tester) async {
    mockOnSubmit(SensorSystem sensorSystem) {
      expect(sensorSystem.sensorName, "Test Sensor");
      expect(sensorSystem.description, isNull);
      expect(sensorSystem.sensorLocation, isNull);
      expect(sensorSystem.humidityThreshold, isNull);
      expect(sensorSystem.temperatureThreshold, isNull);
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorSystemForm(
            existingSensorLocations: existingLocations,
            unconvUser: testUser,
            onSubmit: mockOnSubmit,
          ),
        ),
      ),
    );

    // Enter sensor name
    await tester.enterText(
        find.byKey(const Key('sensorNameField')), 'Test Sensor');
    await tester.pump();

    // Submit form
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Expect form to be submitted successfully (no validation error should remain)
    expect(find.text('Please enter a sensor name'), findsNothing);
  });

  testWidgets(
      'SensorSystemForm validates and submits correctly with all fields',
      (WidgetTester tester) async {
    mockOnSubmit(SensorSystem sensorSystem) {
      expect(sensorSystem.sensorName, "Test Sensor");
      expect(sensorSystem.description, isNotNull);
      expect(sensorSystem.description, 'Very short validation');
      expect(sensorSystem.sensorLocation, isNotNull);
      expect(sensorSystem.humidityThreshold, isNotNull);
      expect(sensorSystem.temperatureThreshold, isNotNull);
    }

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SensorSystemForm(
            existingSensorLocations: existingLocations,
            unconvUser: testUser,
            onSubmit: mockOnSubmit,
          ),
        ),
      ),
    );

    // Enter sensor name
    await tester.enterText(
        find.byKey(const Key('sensorNameField')), 'Test Sensor');
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byKey(const Key('descriptionField')), 'Very short validation');
    await tester.pumpAndSettle();

    // Select a location
    await tester.tap(find.byKey(const Key('sensorLocationField')));
    await tester.pumpAndSettle();
    await tester.tap(find.text(existingLocations[0].locationToString()).last);
    await tester.pumpAndSettle();

    // Enter humidity thresholds
    final maxHumidityField = find.byKey(const Key('maxHumidityField'));
    final minHumidityField = find.byKey(const Key('minHumidityField'));

    await tester.enterText(maxHumidityField, '65.5');
    await tester.enterText(minHumidityField, '30.2');
    await tester.pumpAndSettle();

    // Enter temperature thresholds
    final maxTemperatureField = find.byKey(const Key('maxTemperatureField'));
    final minTemperatureField = find.byKey(const Key('minTemperatureField'));

    await tester.enterText(maxTemperatureField, '65.5');
    await tester.enterText(minTemperatureField, '30.2');
    await tester.pumpAndSettle();

    // Submit form
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // Expect form to be submitted successfully (no validation error should remain)
    expect(find.text('Please enter a sensor name'), findsNothing);
  });
}
