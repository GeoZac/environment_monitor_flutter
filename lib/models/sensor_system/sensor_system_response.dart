import 'sensor_system.dart';

class SensorSystemResponse {
  bool isFirst;
  bool isLast;
  bool hasNext;
  bool hasPrevious;
  List<SensorSystem> data;
  int totalElements;
  int pageNumber;
  int totalPages;

  SensorSystemResponse({
    required this.isFirst,
    required this.isLast,
    required this.hasNext,
    required this.hasPrevious,
    required this.data,
    required this.totalElements,
    required this.pageNumber,
    required this.totalPages,
  });

  factory SensorSystemResponse.fromJson(Map<String, dynamic> json) {
    List<SensorSystem> data = <SensorSystem>[];
    json['data'].forEach((v) {
      data.add(SensorSystem.fromJson(v));
    });

    return SensorSystemResponse(
        isFirst: json['isFirst'],
        isLast: json['isLast'],
        hasNext: json['hasNext'],
        hasPrevious: json['hasPrevious'],
        data: data,
        totalElements: json['totalElements'],
        pageNumber: json['pageNumber'],
        totalPages: json['totalPages']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isFirst'] = isFirst;
    data['isLast'] = isLast;
    data['hasNext'] = hasNext;
    data['hasPrevious'] = hasPrevious;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    data['totalElements'] = totalElements;
    data['pageNumber'] = pageNumber;
    data['totalPages'] = totalPages;
    return data;
  }
}
