import 'package:environment_monitor/consts/sensor_location_type.dart';
import 'package:environment_monitor/models/sensor_location/sensor_location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test Indoor SensorLocation.fromJson', () {
    // Sample JSON data
    final json = {
      "id": "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe",
      "sensorLocationText": "Some Place",
      "latitude": 18.499733,
      "longitude": 56.9241666,
      "sensorLocationType": "INDOOR",
    };

    // Perform the model mapping
    final SensorLocation sensorLocation = SensorLocation.fromJson(json);

    // Verify the values
    expect(sensorLocation.id, "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe");
    expect(sensorLocation.sensorLocationText, "Some Place");
    expect(sensorLocation.latitude, 18.499733);
    expect(sensorLocation.longitude, 56.9241666);
    expect(sensorLocation.sensorLocationType, SensorLocationType.indoor);
  });

  test('Test Outdoor SensorLocation.fromJson', () {
    // Sample JSON data
    final json = {
      "id": "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe",
      "sensorLocationText": "Some Place",
      "latitude": 18.499733,
      "longitude": 56.9241666,
      "sensorLocationType": "OUTDOOR",
    };

    // Perform the model mapping
    final SensorLocation sensorLocation = SensorLocation.fromJson(json);

    // Verify the values
    expect(sensorLocation.id, "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe");
    expect(sensorLocation.sensorLocationText, "Some Place");
    expect(sensorLocation.latitude, 18.499733);
    expect(sensorLocation.longitude, 56.9241666);
    expect(sensorLocation.sensorLocationType, SensorLocationType.outdoor);
  });

  test("Failure", (() {
    final json = {
      "sensorLocationText": "Some Place",
      "latitude": 18.499733,
      "longitude": 56.9241666,
    };

    expect(() => SensorLocation.fromJson(json), throwsFormatException);
  }));

  test("Throw ArgumentError when Sensor Location Type is invalid", (() {
    final json = {
      "id": "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe",
      "sensorLocationText": "Some Place",
      "latitude": 18.499733,
      "longitude": 56.9241666,
      "sensorLocationType": "UNSPECIFIED",
    };

    expect(() => SensorLocation.fromJson(json), throwsArgumentError);
  }));

  test('toJson() should return a valid JSON map for indoor Sensor', () {
    final instance = SensorLocation(
      id: "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe",
      sensorLocationText: "Some Place",
      latitude: 18.499733,
      longitude: 56.9241666,
      sensorLocationType: SensorLocationType.indoor,
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe'));
    expect(json['sensorLocationText'], equals('Some Place'));
    expect(json['latitude'], 18.499733);
    expect(json['longitude'], 56.9241666);
    expect(json['sensorLocationType'], equals('INDOOR'));
  });

  test('toJson() should return a valid JSON map for outdoor Sensor', () {
    final instance = SensorLocation(
      id: "a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe",
      sensorLocationText: "Some Place",
      latitude: 18.499733,
      longitude: 56.9241666,
      sensorLocationType: SensorLocationType.outdoor,
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('a45f79ce-2b9e-4cd4-b4e7-32acbbbed4fe'));
    expect(json['sensorLocationText'], equals('Some Place'));
    expect(json['latitude'], 18.499733);
    expect(json['longitude'], 56.9241666);
    expect(json['sensorLocationType'], equals('OUTDOOR'));
  });
}
