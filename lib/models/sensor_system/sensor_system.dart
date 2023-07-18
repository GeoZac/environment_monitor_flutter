import '../user/unconv_user.dart';

class SensorSystem {
  String id;
  String sensorName;
  UnconvUser unconvUser;

  SensorSystem({
    required this.id,
    required this.sensorName,
    required this.unconvUser,
  });

  factory SensorSystem.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'sensorName',
      'unconvUser',
    ];

    final bool missingFields = requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return SensorSystem(
      id: json['id'],
      sensorName: json['sensorName'],
      unconvUser: UnconvUser.fromJson(json['unconvUser']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sensorName'] = sensorName;
    data['unconvUser'] = unconvUser.toJson();
    return data;
  }
}
