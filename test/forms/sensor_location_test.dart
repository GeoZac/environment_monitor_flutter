import 'package:environment_monitor/forms/sensor_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SensorLocationForm renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: SensorLocationForm(),
    )));

    expect(find.text('New Location'), findsOneWidget);
    expect(
        find.text('Enter Sensor area location values below'), findsOneWidget);
    expect(find.text('Location Name'), findsOneWidget);
    expect(find.text('Latitude'), findsOneWidget);
    expect(find.text('Longitude'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Add Location'), findsOneWidget);
  });

  testWidgets('Text fields exist and can receive input',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: SensorLocationForm())));

    var nameField = find.widgetWithText(TextField, 'Location Name');
    var latField = find.widgetWithText(TextField, 'Latitude');
    var lonField = find.widgetWithText(TextField, 'Longitude');

    await tester.enterText(nameField, 'Test Location');
    await tester.enterText(latField, '12.34');
    await tester.enterText(lonField, '56.78');

    expect(find.text('Test Location'), findsOneWidget);
    expect(find.text('12.34'), findsOneWidget);
    expect(find.text('56.78'), findsOneWidget);
  });

  testWidgets('Cancel button dismisses the form', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => SensorLocationForm(),
        ),
      ),
    ));

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.byType(SensorLocationForm), findsNothing);
  });

  testWidgets('Add Location button dismisses the form',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => SensorLocationForm(),
        ),
      ),
    ));

    await tester.tap(find.text('Add Location'));
    await tester.pumpAndSettle();

    expect(find.byType(SensorLocationForm), findsNothing);
  });
}
