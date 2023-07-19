import '../../consts/sensor_location_type.dart';

class SensorLocation {
  String id;
  String sensorLocationText;
  double latitude;
  double longitude;
  SensorLocationType sensorLocationType;

  SensorLocation({
    required this.id,
    required this.sensorLocationText,
    required this.latitude,
    required this.longitude,
    required this.sensorLocationType,
  });

  factory SensorLocation.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'sensorLocationText',
      'latitude',
      'longitude',
      'sensorLocationType',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return SensorLocation(
      id: json['id'],
      sensorLocationText: json['sensorLocationText'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      sensorLocationType:
          parseSensorLocationTypeFromJson(json['sensorLocationType']),
    );
  }

  static SensorLocationType parseSensorLocationTypeFromJson(String value) {
    switch (value) {
      case 'INDOOR':
        return SensorLocationType.indoor;
      case 'OUTDOOR':
        return SensorLocationType.outdoor;
      default:
        throw ArgumentError('Invalid sensor location type: $value');
    }
  }

  static String parseSensorLocationTypeToJson(SensorLocationType value) {
    switch (value) {
      case SensorLocationType.indoor:
        return 'INDOOR';
      case SensorLocationType.outdoor:
      default:
        return 'OUTDOOR';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sensorLocationText': sensorLocationText,
      'latitude': latitude,
      'longitude': longitude,
      'sensorLocationType': parseSensorLocationTypeToJson(sensorLocationType),
    };
  }
}
