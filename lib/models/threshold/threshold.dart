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
