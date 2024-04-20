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
    return SensorAuthToken(
      id: json['id'],
      authToken: json['authToken'],
      expiry: json['expiry'],
      sensorSystem: SensorSystem.fromJson(json['sensorSystem']),
    );
  }
}
