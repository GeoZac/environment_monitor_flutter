/// Utility constants and validation methods for environmental sensor thresholds.
///
/// This file defines minimum and maximum limits for humidity and temperature
/// readings, along with validation helper functions that ensure user-provided
/// values fall within acceptable sensor data ranges.
library;

/// Minimum allowed humidity value (percentage).
const double minHumidityValue = 0;

/// Maximum allowed humidity value (percentage).
const double maxHumidityValue = 100;

/// Minimum allowed temperature value (in degrees Celsius).
const double minTemperatureValue = -9999.000;

/// Maximum allowed temperature value (in degrees Celsius).
const double maxTemperatureValue = 9999.000;

/// Validates a humidity input value.
///
/// - Returns `null` if the value is valid or empty (no validation error).
/// - Returns a human-readable error message if the value is not a valid number
///   or falls outside the defined range.
///
/// **Validation logic:**
/// 1. Empty or null inputs are considered valid (optional field).
/// 2. Non-numeric values are rejected.
/// 3. Values below [minHumidityValue] or above/equal to [maxHumidityValue]
///    return descriptive validation messages.
///
/// Example:
/// ```dart
/// validateHumidityValue("55");   // → null (valid)
/// validateHumidityValue("abc");  // → "Should be within 0.0 and 100.0"
/// validateHumidityValue("120");  // → "Should be less than 100.0"
/// ```
String? validateHumidityValue(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  double? humidity = double.tryParse(value);
  if (humidity == null) {
    return "Should be within $minHumidityValue and $maxHumidityValue";
  }
  if (humidity < minHumidityValue) {
    return "Should be more than $minHumidityValue";
  }
  if (humidity >= maxHumidityValue) {
    return "Should be less than $maxHumidityValue";
  }
  return null;
}

/// Validates a temperature input value.
///
/// - Returns `null` if the value is valid or empty (no validation error).
/// - Returns a descriptive error message if the input is not a number or
///   outside the defined sensor limits.
///
/// **Validation logic:**
/// 1. Empty or null inputs are allowed.
/// 2. Non-numeric values fail validation.
/// 3. Temperatures below [minTemperatureValue] or above/equal to
///    [maxTemperatureValue] produce clear messages.
///
/// Example:
/// ```dart
/// validateTemperatureValue("24.5");   // → null (valid)
/// validateTemperatureValue("-10000"); // → "Should be more than -9999.0"
/// validateTemperatureValue("abc");    // → "Should be within -9999.0 and 9999.0"
/// ```
String? validateTemperatureValue(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  double? temperature = double.tryParse(value);
  if (temperature == null) {
    return "Should be within $minTemperatureValue and $maxTemperatureValue";
  }
  if (temperature < minTemperatureValue) {
    return "Should be more than $minTemperatureValue";
  }
  if (temperature >= maxTemperatureValue) {
    return "Should be less than $maxTemperatureValue";
  }
  return null;
}
