import 'envt_reading.dart';

class EnvironmentalReadingResponse {
  bool isFirst;
  bool isLast;
  bool hasNext;
  bool hasPrevious;
  List<EnvironmentalReading> data;
  int totalElements;
  int pageNumber;
  int totalPages;

  EnvironmentalReadingResponse({
    required this.isFirst,
    required this.isLast,
    required this.hasNext,
    required this.hasPrevious,
    required this.data,
    required this.totalElements,
    required this.pageNumber,
    required this.totalPages,
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
