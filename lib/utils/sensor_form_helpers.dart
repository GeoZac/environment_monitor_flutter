// Humidity threshold limits
const double minHumidityValue = 0;
const double maxHumidityValue = 100;

// Temperature threshold limits
const double minTemperatureValue = -9999.000;
const double maxTemperatureValue = 9999.000;

String? validateHumidityValue(String minLimitValue) {
  double? minLimit = double.tryParse(minLimitValue);
  if (minLimit == null) {
    return "Should be within $minHumidityValue and $maxHumidityValue";
  }
  if (minLimit < 0) return "Should be more than $minHumidityValue";
  if (minLimit >= 100) return "Should be less than $maxHumidityValue";
  return null;
}

String? validateTemperatureValue(String minLimitValue) {
  double? minLimit = double.tryParse(minLimitValue);
  if (minLimit == null) {
    return "Should be within $minTemperatureValue and $maxTemperatureValue";
  }
  if (minLimit < 0) return "Should be more than $minTemperatureValue";
  if (minLimit >= 100) return "Should be less than $maxTemperatureValue";
  return null;
}
