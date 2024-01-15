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
    // Test case 2: JSON missing 'id' field
    final json = {
      "sensorLocationText": "Some Place",
      "latitude": 18.499733,
      "longitude": 56.9241666,
      "sensorLocationType": "OUTDOOR",
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

  test("Parse SensorLocation json data to List", (() {
    final List jsonData = [
      {
        "id": "d3082569-2667-466e-b51a-f69d1319034e",
        "sensorLocationText": "GQI",
        "latitude": 13.436140660577678,
        "longitude": 179.7779088773541,
        "sensorLocationType": "OUTDOOR",
      },
      {
        "id": "737aa1e2-4b07-4058-8bbc-89bee8208fa9",
        "sensorLocationText": "QEEREHDMFQ",
        "latitude": -8.683114422179202,
        "longitude": -64.29258062822183,
        "sensorLocationType": "OUTDOOR",
      },
      {
        "id": "c414fa34-45a7-4626-9c6c-26188366d793",
        "sensorLocationText": "DTF",
        "latitude": -47.02522450124238,
        "longitude": 87.83869742329769,
        "sensorLocationType": "INDOOR",
      }
    ];

    List<SensorLocation> sensorList =
        jsonData.map((dynamic item) => SensorLocation.fromJson(item)).toList();

    expect(sensorList, isA<List<SensorLocation>>());
    expect(sensorList.length, 3);
  }));
}
