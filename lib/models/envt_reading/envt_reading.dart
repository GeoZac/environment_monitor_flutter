import '../sensor_system/sensor_system.dart';

class EnvironmentalReading {
  String? id;
  double? temperature;
  double? humidity;
  String? timestamp;
  SensorSystem? sensorSystem;

  EnvironmentalReading({
    this.id,
    this.temperature,
    this.humidity,
    this.timestamp,
    this.sensorSystem,
  });

  EnvironmentalReading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    timestamp = json['timestamp'];
    sensorSystem = json['sensorSystem'] != null
        ? SensorSystem.fromJson(json['sensorSystem'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['timestamp'] = timestamp;
    if (sensorSystem != null) {
      data['sensorSystem'] = sensorSystem!.toJson();
    }
    return data;
  }
}
