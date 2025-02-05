import 'package:environment_monitor/consts/color_consts.dart';
import 'package:environment_monitor/widgets/sensor_reading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'SensorReadingContainer displays temperature and humidity correctly',
      (WidgetTester tester) async {
    // Arrange
    const double testTemperature = 23.45;
    const double testHumidity = 60.78;

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SensorReadingContainer(
            temperature: testTemperature,
            humidity: testHumidity,
          ),
        ),
      ),
    );

    // Assert
    expect(find.text("23.45 ℃"), findsOneWidget);
    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text("60.78 %"), findsOneWidget);
    expect(find.text('Humidity'), findsOneWidget);
  });

  testWidgets('SensorReadingContainer has correct styles',
      (WidgetTester tester) async {
    // Arrange
    const double testTemperature = 23.45;
    const double testHumidity = 60.78;

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SensorReadingContainer(
            temperature: testTemperature,
            humidity: testHumidity,
          ),
        ),
      ),
    );

    // Assert for text style of temperature
    final tempText = tester.widget<Text>(find.text("23.45 ℃"));
    expect(tempText.style!.color, ColorConstants.textColorGreen);
    expect(tempText.style!.fontSize, 32);
    expect(tempText.style!.fontWeight, FontWeight.bold);

    // Assert for text style of humidity
    final humidityText = tester.widget<Text>(find.text("60.78 %"));
    expect(humidityText.style!.color, ColorConstants.textColorGreen);
    expect(humidityText.style!.fontSize, 32);
    expect(humidityText.style!.fontWeight, FontWeight.bold);

    // Assert for sub-title styles
    final tempSubTitle = tester.widget<Text>(find.text('Temperature'));
    expect(tempSubTitle.style!.color, ColorConstants.textColorMuted);
    expect(tempSubTitle.style!.fontSize, 16);

    final humiditySubTitle = tester.widget<Text>(find.text('Humidity'));
    expect(humiditySubTitle.style!.color, ColorConstants.textColorMuted);
    expect(humiditySubTitle.style!.fontSize, 16);
  });
}
