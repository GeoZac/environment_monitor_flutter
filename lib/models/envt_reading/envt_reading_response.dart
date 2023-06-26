import 'envt_reading.dart';

class EnvironmentalReadingResponse {
  bool? isFirst;
  bool? isLast;
  bool? hasNext;
  bool? hasPrevious;
  List<EnvironmentalReading>? data;
  int? totalElements;
  int? pageNumber;
  int? totalPages;

  EnvironmentalReadingResponse({
    this.isFirst,
    this.isLast,
    this.hasNext,
    this.hasPrevious,
    this.data,
    this.totalElements,
    this.pageNumber,
    this.totalPages,
  });

  EnvironmentalReadingResponse.fromJson(Map<String, dynamic> json) {
    isFirst = json['isFirst'];
    isLast = json['isLast'];
    hasNext = json['hasNext'];
    hasPrevious = json['hasPrevious'];
    if (json['data'] != null) {
      data = <EnvironmentalReading>[];
      json['data'].forEach((v) {
        data!.add(EnvironmentalReading.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
    pageNumber = json['pageNumber'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isFirst'] = isFirst;
    data['isLast'] = isLast;
    data['hasNext'] = hasNext;
    data['hasPrevious'] = hasPrevious;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalElements'] = totalElements;
    data['pageNumber'] = pageNumber;
    data['totalPages'] = totalPages;
    return data;
  }
}
