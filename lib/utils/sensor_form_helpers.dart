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
