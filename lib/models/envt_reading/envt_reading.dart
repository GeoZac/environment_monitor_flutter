class EnvironmentalReading {
  String? id;
  double? temperature;
  double? humidity;
  String? timestamp;

  EnvironmentalReading({
    this.id,
    this.temperature,
    this.humidity,
    this.timestamp,
  });

  EnvironmentalReading.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['timestamp'] = timestamp;
    return data;
  }
}
