import '../shared/page.dart';
import 'envt_reading.dart';

class EnvironmentalReadingResponse extends Page<EnvironmentalReading> {
  EnvironmentalReadingResponse({
    required super.isFirst,
    required super.isLast,
    required super.hasNext,
    required super.hasPrevious,
    required super.data,
    required super.totalElements,
    required super.pageNumber,
    required super.totalPages,
  });

  factory EnvironmentalReadingResponse.fromJson(Map<String, dynamic> json) {
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

    List<EnvironmentalReading> data = <EnvironmentalReading>[];
    json['data'].forEach((v) {
      data.add(EnvironmentalReading.fromJson(v));
    });

    return EnvironmentalReadingResponse(
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
