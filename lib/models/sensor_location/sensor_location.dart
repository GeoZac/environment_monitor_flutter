import '../../consts/sensor_location_type.dart';

/// A class representing a sensor location with associated information.
class SensorLocation {
  /// The unique identifier for the sensor location.
  String id;

  /// The descriptive text for the sensor location.
  String sensorLocationText;

  /// The latitude coordinate of the sensor location.
  double latitude;

  /// The longitude coordinate of the sensor location.
  double longitude;

  /// The type of sensor location denoted by [SensorLocationType] (e.g., indoor or outdoor).
  SensorLocationType sensorLocationType;

  /// Creates a new instance of the [SensorLocation] class.
  ///
  /// [id]: The unique identifier for the sensor location.
  /// [sensorLocationText]: The descriptive text for the sensor location.
  /// [latitude]: The latitude coordinate of the sensor location.
  /// [longitude]: The longitude coordinate of the sensor location.
  /// [sensorLocationType]: The type of sensor location (indoor or outdoor).
  SensorLocation({
    required this.id,
    required this.sensorLocationText,
    required this.latitude,
    required this.longitude,
    required this.sensorLocationType,
  });

  /// Creates a [SensorLocation] instance from a JSON map.
  ///
  /// Throws a [FormatException] if required fields are missing in the JSON.
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

  /// Parses a string value from JSON representing a sensor location type
  /// and returns the corresponding [SensorLocationType] enum value.
  ///
  /// This function is typically used when deserializing JSON data
  /// to convert a string representation of a sensor location type
  /// into its corresponding enum value.
  ///
  /// Throws an [ArgumentError] if the provided value is not a valid
  /// representation of a sensor location type.
  ///
  /// Throws:
  /// - [ArgumentError] : If the provided value is not a valid sensor location type.
  ///
  /// Returns:
  /// - [SensorLocationType] : The enum value corresponding to the input string.
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

  /// Converts a [SensorLocationType] to a JSON string.
  static String parseSensorLocationTypeToJson(SensorLocationType value) {
    switch (value) {
      case SensorLocationType.indoor:
        return 'INDOOR';
      case SensorLocationType.outdoor:
      default:
        return 'OUTDOOR';
    }
  }

  /// Converts the [SensorLocation] instance to a JSON map.
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
