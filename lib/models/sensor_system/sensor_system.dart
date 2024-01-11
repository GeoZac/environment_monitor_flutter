import '../../consts/sensor_status.dart';
import '../sensor_location/sensor_location.dart';
import '../user/unconv_user.dart';

class SensorSystem {
  String? id;
  String sensorName;
  String? description;
  bool deleted;
  SensorStatus sensorStatus;
  SensorLocation? sensorLocation;
  UnconvUser unconvUser;

  SensorSystem({
    this.id,
    required this.sensorName,
    this.description,
    required this.deleted,
    required this.sensorStatus,
    this.sensorLocation,
    required this.unconvUser,
  });

  factory SensorSystem.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'sensorName',
      'deleted',
      'sensorStatus',
      'unconvUser',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return SensorSystem(
      id: json['id'],
      sensorName: json['sensorName'],
      description: json['description'],
      deleted: json['deleted'],
      sensorStatus: parseSensorStatusFromJson(json['sensorStatus']),
      sensorLocation: json['sensorLocation'] != null
          ? SensorLocation.fromJson(json['sensorLocation'])
          : null,
      unconvUser: UnconvUser.fromJson(json['unconvUser']),
    );
  }

  static SensorStatus parseSensorStatusFromJson(String value) {
    switch (value) {
      case 'ACTIVE':
        return SensorStatus.active;
      case 'INACTIVE':
        return SensorStatus.inactive;
      default:
        throw ArgumentError('Invalid sensor status: $value');
    }
  }

  static String parseSensorStatusToJson(SensorStatus value) {
    switch (value) {
      case SensorStatus.active:
        return 'ACTIVE';
      case SensorStatus.inactive:
      default:
        return 'INACTIVE';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sensorName'] = sensorName;
    data['description'] = description;
    data['deleted'] = deleted;
    data['sensorStatus'] = parseSensorStatusToJson(sensorStatus);
    if (sensorLocation != null) {
      data['sensorLocation'] = sensorLocation!.toJson();
    }
    data['unconvUser'] = unconvUser.toJson();
    return data;
  }
}
