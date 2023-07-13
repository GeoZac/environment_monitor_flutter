import '../user/unconv_user.dart';

class SensorSystem {
  String? id;
  String? sensorName;
  UnconvUser? unconvUser;

  SensorSystem({
    this.id,
    this.sensorName,
    this.unconvUser,
  });

  SensorSystem.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'id',
      'sensorName',
      'unconvUser',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    id = json['id'];
    sensorName = json['sensorName'];
    unconvUser = json['unconvUser'] != null
        ? UnconvUser.fromJson(json['unconvUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sensorName'] = sensorName;
    if (unconvUser != null) {
      data['unconvUser'] = unconvUser!.toJson();
    }
    return data;
  }
}
