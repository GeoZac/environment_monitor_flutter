import '../shared/page.dart';
import 'sensor_system_dto.dart';

class SensorSystemResponse extends Page<SensorSystemDTO> {
  SensorSystemResponse({
    required bool isFirst,
    required bool isLast,
    required bool hasNext,
    required bool hasPrevious,
    required List<SensorSystemDTO> data,
    required int totalElements,
    required int pageNumber,
    required int totalPages,
  }) : super(
          isFirst: isFirst,
          isLast: isLast,
          hasNext: hasNext,
          hasPrevious: hasPrevious,
          data: data,
          totalElements: totalElements,
          pageNumber: pageNumber,
          totalPages: totalPages,
        );

  factory SensorSystemResponse.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      "isFirst",
      "isLast",
      "hasNext",
      "hasPrevious",
      "data",
      "totalElements",
      "pageNumber",
      "totalPages",
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    List<SensorSystemDTO> data = <SensorSystemDTO>[];
    json['data'].forEach((v) {
      data.add(SensorSystemDTO.fromJson(v));
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
}
