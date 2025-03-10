import '../sensor_system/sensor_system.dart';
import 'base_envt_reading.dart';

class EnvironmentalReading extends BaseEnvironmentalReading {
  String id;
  SensorSystem sensorSystem;

  EnvironmentalReading({
    required this.id,
    required super.temperature,
    required super.humidity,
    required super.timestamp,
    required this.sensorSystem,
  });

  factory EnvironmentalReading.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'sensorSystem',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    final BaseEnvironmentalReading baseEnvironmentalReading =
        BaseEnvironmentalReading.fromJson(json);

    return EnvironmentalReading(
      id: json['id'],
      temperature: baseEnvironmentalReading.temperature,
      humidity: baseEnvironmentalReading.humidity,
      timestamp: baseEnvironmentalReading.timestamp,
      sensorSystem: SensorSystem.fromJson(json['sensorSystem']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['id'] = id;
    data['sensorSystem'] = sensorSystem.toJson();
    return data;
  }
}
