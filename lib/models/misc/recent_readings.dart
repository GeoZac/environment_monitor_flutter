class RecentReadings {
  /// Reading count or value in the past 1 hour.
  int? i1;

  /// Reading count or value in the past 3 hours.
  int? i3;

  /// Reading count or value in the past 8 hours.
  int? i8;

  /// Reading count or value in the past 24 hours.
  int? i24;

  /// Reading count or value in the past 168 hours (1 week).
  int? i168;

  /// Creates a [RecentReadings] instance with optional interval readings.
  RecentReadings({
    this.i1,
    this.i3,
    this.i8,
    this.i24,
    this.i168,
  });

  /// Creates a [RecentReadings] instance from a JSON map.
  ///
  /// Expects all of the following keys to be present in [json]:
  /// `'1'`, `'3'`, `'8'`, `'24'`, `'168'`.
  ///
  /// Throws a [FormatException] if any of the required fields are missing.
  factory RecentReadings.fromJson(Map<String, dynamic> json) {
    const requiredFields = [
      '1',
      '3',
      '8',
      '24',
      '168',
    ];

    final bool missingFields =
        requiredFields.any((field) => json[field] == null);
    if (missingFields) {
      throw const FormatException("Missing required fields in JSON");
    }

    return RecentReadings(
      i1: json['1'],
      i3: json['3'],
      i8: json['8'],
      i24: json['24'],
      i168: json['168'],
    );
  }
}
