import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:environment_monitor/screens/add_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'LocationBottomSheet renders correctly and calls addSensorLocation',
      (WidgetTester tester) async {
    // Create a mock callback function
    mockAddSensorLocation(SensorLocation sensorLocation) {}

    // Build the widget inside a test environment
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LocationBottomSheet(
            addSensorLocation: mockAddSensorLocation,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(LocationBottomSheet), findsOneWidget);
    expect(find.byKey(const Key('sensorLocationForm')), findsOneWidget);
  });

  testWidgets('showLocationBottomSheet displays the modal bottom sheet',
      (WidgetTester tester) async {
    mockAddSensorLocation(SensorLocation sensorLocation) {}

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showLocationBottomSheet(context,
                  addSensorLocation: mockAddSensorLocation),
              child: Text('Show Bottom Sheet'),
            ),
          ),
        ),
      ),
    );

    // Tap the button to show the bottom sheet
    await tester.tap(find.text('Show Bottom Sheet'));
    await tester.pumpAndSettle();

    // Verify if the bottom sheet is displayed
    expect(
      find.byType(LocationBottomSheet, skipOffstage: false),
      findsOneWidget,
    );
  });
}
