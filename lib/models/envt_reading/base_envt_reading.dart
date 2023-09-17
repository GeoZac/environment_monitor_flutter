class BaseEnvironmentalReading {
  double temperature;
  double humidity;
  String timestamp;

  BaseEnvironmentalReading({
    required this.temperature,
    required this.humidity,
    required this.timestamp,
  });

  factory BaseEnvironmentalReading.fromJson(Map<String, dynamic> json) {
    final List<String> requiredFields = [
      'temperature',
      'humidity',
      'timestamp',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return BaseEnvironmentalReading(
      temperature: json['temperature'],
      humidity: json['humidity'],
      timestamp: json['timestamp'],
    );
  }
}
