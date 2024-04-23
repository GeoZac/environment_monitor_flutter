import '../sensor_system/sensor_system.dart';

class SensorAuthToken {
  String id;
  String authToken;
  String expiry;
  SensorSystem sensorSystem;

  SensorAuthToken({
    required this.id,
    required this.authToken,
    required this.expiry,
    required this.sensorSystem,
  });

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
