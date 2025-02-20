class Threshold {
  String? id;
  double minValue;
  double maxValue;

  Threshold({
    this.id,
    required this.minValue,
    required this.maxValue,
  });

  factory Threshold.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'minValue',
      'maxValue',
    ];
    final bool missingFields =
        requiredFields.any((field) => json[field] == null);

    if (missingFields) {
      throw const FormatException(
          "Missing required fields: minValue and maxValue");
    }

    return Threshold(
      id: json['id'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'minValue': minValue,
      'maxValue': maxValue,
    };
  }
}
