import '../sensor_system/sensor_system.dart';

/// A class representing an authentication token for a sensor system.
///
/// This class holds information about an authentication token used for accessing
/// a sensor system, including its unique identifier, authentication token,
/// expiry date, and the associated [SensorSystem].
class SensorAuthToken {
  /// The unique identifier of the authentication token.
  String id;

  /// The authentication token string.
  String authToken;

  /// The expiry date of the authentication token.
  String expiry;

  /// The sensor system associated with this authentication token.
  SensorSystem sensorSystem;

  /// Constructs a [SensorAuthToken] instance with the provided parameters.
  ///
  /// All parameters are required.
  SensorAuthToken({
    required this.id,
    required this.authToken,
    required this.expiry,
    required this.sensorSystem,
  });

  /// Constructs a [SensorAuthToken] instance from a JSON map.
  ///
  /// The [json] parameter should be a map representing the JSON structure
  /// of the authentication token.
  ///
  /// Throws a [FormatException] if any of the required fields are missing
  /// in the JSON.
  factory SensorAuthToken.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'authToken',
      'expiry',
      'sensorSystem',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return SensorAuthToken(
      id: json['id'],
      authToken: json['authToken'],
      expiry: json['expiry'],
      sensorSystem: SensorSystem.fromJson(json['sensorSystem']),
    );
  }
}
