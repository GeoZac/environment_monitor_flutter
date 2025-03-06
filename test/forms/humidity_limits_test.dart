import 'package:environment_monitor/forms/humidity_limits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HumidityLimits saves correct values',
      (WidgetTester tester) async {
    double? savedMaxHumidity;
    double? savedMinHumidity;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HumidityLimits(
            onSaved: (max, min) {
              savedMaxHumidity = max;
              savedMinHumidity = min;
            },
          ),
        ),
      ),
    );

    final maxHumidityField = find.byKey(const Key('maxHumidityField'));
    final minHumidityField = find.byKey(const Key('minHumidityField'));

    await tester.enterText(maxHumidityField, '65.5');
    await tester.enterText(minHumidityField, '30.2');
    await tester.pump();

    expect(savedMaxHumidity, 65.5);
    expect(savedMinHumidity, 30.2);
  });

  testWidgets('HumidityLimits saves null when fields are empty',
      (WidgetTester tester) async {
    double? savedMaxHumidity;
    double? savedMinHumidity;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HumidityLimits(
            onSaved: (max, min) {
              savedMaxHumidity = max;
              savedMinHumidity = min;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byKey(const Key('maxHumidityField')), '');
    await tester.enterText(find.byKey(const Key('minHumidityField')), '');
    await tester.pump();

    expect(savedMaxHumidity, isNull);
    expect(savedMinHumidity, isNull);
  });
}
