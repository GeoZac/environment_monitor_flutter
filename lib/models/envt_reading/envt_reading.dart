import '../sensor_system/sensor_system.dart';
import 'base_envt_reading.dart';

class EnvironmentalReading extends BaseEnvironmentalReading {
  String id;
  SensorSystemDTO sensorSystem;

  EnvironmentalReading({
    required this.id,
    required double temperature,
    required double humidity,
    required String timestamp,
    required this.sensorSystem,
  }) : super(
          temperature: temperature,
          humidity: humidity,
          timestamp: timestamp,
        );

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
      sensorSystem: SensorSystemDTO.fromJson(json['sensorSystem']),
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
