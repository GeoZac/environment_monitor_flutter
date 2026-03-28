/// Represents a numeric threshold with a minimum and maximum value.
///
/// The [Threshold] class is typically used to define acceptable ranges
/// for measurements, sensor readings, or other quantitative metrics.
///
/// The class includes:
/// - An optional [id] for identifying the threshold.
/// - Required [minValue] and [maxValue] properties defining the range.
/// - JSON serialization/deserialization via [toJson] and [fromJson].
class Threshold {
  /// Optional unique identifier for this threshold.
  String? id;

  /// Minimum allowed value.
  double minValue;

  /// Maximum allowed value.
  double maxValue;

  /// Creates a [Threshold] instance with required min and max values.
  Threshold({
    this.id,
    required this.minValue,
    required this.maxValue,
  });

  /// Creates a [Threshold] instance from a JSON map.
  ///
  /// Expects at least 'minValue' and 'maxValue' keys in [json].
  /// Throws a [FormatException] if any of the required fields are missing.
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

  /// Converts this [Threshold] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'minValue': minValue,
      'maxValue': maxValue,
    };
  }
}
