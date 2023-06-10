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
