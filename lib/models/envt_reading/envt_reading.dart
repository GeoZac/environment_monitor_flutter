import '../sensor_system/sensor_system.dart';

class EnvironmentalReading {
  String id;
  double temperature;
  double humidity;
  String timestamp;
  SensorSystem sensorSystem;

  EnvironmentalReading({
    required this.id,
    required this.temperature,
    required this.humidity,
    required this.timestamp,
    required this.sensorSystem,
  });

  factory EnvironmentalReading.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'temperature',
      'humidity',
      'timestamp',
      'sensorSystem'
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return EnvironmentalReading(
      id: json['id'],
      temperature: json['temperature'],
      humidity: json['humidity'],
      timestamp: json['timestamp'],
      sensorSystem: SensorSystem.fromJson(json['sensorSystem']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['timestamp'] = timestamp;
    data['sensorSystem'] = sensorSystem.toJson();
    return data;
  }
}
