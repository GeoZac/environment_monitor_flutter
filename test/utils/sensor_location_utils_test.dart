import 'package:environment_monitor/utils/sensor_location_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Latitude Validation', () {
    test('Valid Latitude value', () {
      expect(validateLatitudeValue('50'), isNull);
    });

    test('Invalid Latitude value - not a number', () {
      expect(validateLatitudeValue('abc'),
          equals('Should be within -90.0 and 90.0'));
    });

    test('Invalid Latitude value - below minimum', () {
      expect(validateLatitudeValue('-95'), equals('Should be more than -90.0'));
    });

    test('Invalid Latitude value - above maximum', () {
      expect(validateLatitudeValue('110'), equals('Should be less than 90.0'));
    });
  });

  group('Longitude Validation', () {
    test('Valid Longitude value', () {
      expect(validateLongitudeValue('25'), isNull);
    });

    test('Invalid Longitude value - not a number', () {
      expect(validateLongitudeValue('xyz'),
          equals('Should be within -180.0 and 180.0'));
    });

    test('Invalid Longitude value - below minimum', () {
      expect(validateLongitudeValue('-10000'),
          equals('Should be more than -180.0'));
    });

    test('Invalid Longitude value - above maximum', () {
      expect(
          validateLongitudeValue('10000'), equals('Should be less than 180.0'));
    });
  });
}
