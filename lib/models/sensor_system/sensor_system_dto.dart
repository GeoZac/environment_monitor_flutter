import '../envt_reading/base_envt_reading.dart';
import 'sensor_system.dart';

class SensorSystemDTO extends SensorSystem {
  int readingCount;
  BaseEnvironmentalReading? latestReading;
  String createdDate;
  String updatedDate;

  SensorSystemDTO({
    required super.id,
    required super.sensorName,
    super.description,
    required super.deleted,
    required super.sensorStatus,
    super.sensorLocation,
    required super.unconvUser,
    required this.readingCount,
    this.latestReading,
    super.humidityThreshold,
    super.temperatureThreshold,
    required this.createdDate,
    required this.updatedDate,
  });

  factory SensorSystemDTO.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'readingCount',
      'createdDate',
      'updatedDate',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    final sensorSystem = SensorSystem.fromJson(json);

    return SensorSystemDTO(
      id: sensorSystem.id,
      sensorName: sensorSystem.sensorName,
      description: sensorSystem.description,
      deleted: sensorSystem.deleted,
      sensorStatus: sensorSystem.sensorStatus,
      sensorLocation: sensorSystem.sensorLocation,
      unconvUser: sensorSystem.unconvUser,
      humidityThreshold: sensorSystem.humidityThreshold,
      temperatureThreshold: sensorSystem.temperatureThreshold,
      readingCount: json['readingCount'],
      latestReading: json['latestReading'] != null
          ? BaseEnvironmentalReading.fromJson(json['latestReading'])
          : null,
      createdDate: json['createdDate'],
      updatedDate: json['updatedDate'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['readingCount'] = readingCount;
    data['latestReading'] = latestReading?.toJson();
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    return data;
  }
}
