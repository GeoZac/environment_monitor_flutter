import '../envt_reading/base_envt_reading.dart';
import '../sensor_location/sensor_location.dart';
import '../user/unconv_user.dart';
import 'sensor_system.dart';

class SensorSystemDTO extends SensorSystem {
  int readingCount;
  BaseEnvironmentalReading? latestReading;

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
  });

  factory SensorSystemDTO.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'sensorName',
      'deleted',
      'sensorStatus',
      'unconvUser',
      'readingCount',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return SensorSystemDTO(
      id: json['id'],
      sensorName: json['sensorName'],
      description: json['description'],
      deleted: json['deleted'],
      sensorStatus:
          SensorSystem.parseSensorStatusFromJson(json['sensorStatus']),
      sensorLocation: json['sensorLocation'] != null
          ? SensorLocation.fromJson(json['sensorLocation'])
          : null,
      unconvUser: UnconvUser.fromJson(json['unconvUser']),
      readingCount: json['readingCount'] ?? 0,
      latestReading: json['latestReading'] != null
          ? BaseEnvironmentalReading.fromJson(json['latestReading'])
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sensorName'] = sensorName;
    data['description'] = description;
    data['deleted'] = deleted;
    data['sensorStatus'] = SensorSystem.parseSensorStatusToJson(sensorStatus);
    if (sensorLocation != null) {
      data['sensorLocation'] = sensorLocation!.toJson();
    }
    data['unconvUser'] = unconvUser.toJson();
    data['readingCount'] = readingCount;
    data['latestReading'] = latestReading;
    return data;
  }
}
