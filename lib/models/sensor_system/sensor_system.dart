import '../envt_reading/envt_reading.dart';
import '../sensor_location/sensor_location.dart';
import '../user/unconv_user.dart';

class SensorSystem {
  String id;
  String sensorName;
  SensorLocation? sensorLocation;
  UnconvUser unconvUser;
  int readingCount;
  EnvironmentalReading? latestReading;

  SensorSystem({
    required this.id,
    required this.sensorName,
    this.sensorLocation,
    required this.unconvUser,
    required this.readingCount,
    this.latestReading,
  });

  factory SensorSystem.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'sensorName',
      'unconvUser',
      'readingCount',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return SensorSystem(
      id: json['id'],
      sensorName: json['sensorName'],
      sensorLocation: json['sensorLocation'] != null
          ? SensorLocation.fromJson(json['sensorLocation'])
          : null,
      unconvUser: UnconvUser.fromJson(json['unconvUser']),
      readingCount: json['readingCount'] ?? 0,
      latestReading: json['latestReading'] != null
          ? EnvironmentalReading.fromJson(json['latestReading'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sensorName'] = sensorName;
    if (sensorLocation != null) {
      data['sensorLocation'] = sensorLocation!.toJson();
    }
    data['unconvUser'] = unconvUser.toJson();
    return data;
  }
}
