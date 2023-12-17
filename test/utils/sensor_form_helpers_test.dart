import 'package:environment_monitor/utils/sensor_form_helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Humidity Validation', () {
    test('Valid humidity value', () {
      expect(validateHumidityValue('50'), isNull);
    });

    test('Invalid humidity value - not a number', () {
      expect(validateHumidityValue('abc'),
          equals('Should be within 0.0 and 100.0'));
    });

    test('Invalid humidity value - below minimum', () {
      expect(validateHumidityValue('-5'), equals('Should be more than 0.0'));
    });

    test('Invalid humidity value - above maximum', () {
      expect(validateHumidityValue('110'), equals('Should be less than 100.0'));
    });
  });

  group('Temperature Validation', () {
    test('Valid temperature value', () {
      expect(validateTemperatureValue('25'), isNull);
    });

    test('Invalid temperature value - not a number', () {
      expect(validateTemperatureValue('xyz'),
          equals('Should be within -9999.0 and 9999.0'));
    });

    test('Invalid temperature value - below minimum', () {
      expect(validateTemperatureValue('-10000'),
          equals('Should be more than -9999.0'));
    });

    test('Invalid temperature value - above maximum', () {
      expect(validateTemperatureValue('10000'),
          equals('Should be less than 9999.0'));
    });
  });
}
