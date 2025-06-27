import 'package:environment_monitor/forms/sensor_location.dart';
import 'package:environment_monitor/screens/add_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('showLocationBottomSheet displays modal bottom sheet',
      (WidgetTester tester) async {
    // Build the widget inside a test environment
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showLocationBottomSheet(context,
                      addSensorLocation: (sensor) {});
                },
                child: const Text('Show Bottom Sheet'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Bottom Sheet'));
    await tester.pumpAndSettle();

    // Verify the bottom sheet appears
    expect(find.byType(BottomSheet), findsOneWidget);
  });
  testWidgets('showLocationBottomSheet displays the modal bottom sheet',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showLocationBottomSheet(context,
                      addSensorLocation: (sensor) {});
                },
                child: const Text('Show Bottom Sheet'),
              );
            },
          ),
        ),
      ),
    );

    // Tap the button to show the bottom sheet
    await tester.tap(find.text('Show Bottom Sheet'));
    await tester.pumpAndSettle();

    // Verify if the bottom sheet is displayed
    expect(
      find.byType(SensorLocationForm, skipOffstage: false),
      findsOneWidget,
    );
  });
}
