import 'package:environment_monitor/forms/temperature_limits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TemperatureLimits saves correct values',
      (WidgetTester tester) async {
    double? savedMaxTemperature;
    double? savedMinTemperature;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TemperatureLimits(
            onSaved: (max, min) {
              savedMaxTemperature = max;
              savedMinTemperature = min;
            },
          ),
        ),
      ),
    );

    final maxTemperatureField = find.byKey(const Key('maxTemperatureField'));
    final minTemperatureField = find.byKey(const Key('minTemperatureField'));

    await tester.enterText(maxTemperatureField, '65.5');
    await tester.enterText(minTemperatureField, '30.2');
    await tester.pump();

    expect(savedMaxTemperature, 65.5);
    expect(savedMinTemperature, 30.2);
  });

  testWidgets('TemperatureLimits saves null when fields are empty',
      (WidgetTester tester) async {
    double? savedMaxTemperature;
    double? savedMinTemperature;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TemperatureLimits(
            onSaved: (max, min) {
              savedMaxTemperature = max;
              savedMinTemperature = min;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byKey(const Key('maxTemperatureField')), '');
    await tester.enterText(find.byKey(const Key('minTemperatureField')), '');
    await tester.pump();

    expect(savedMaxTemperature, isNull);
    expect(savedMinTemperature, isNull);
  });
}
