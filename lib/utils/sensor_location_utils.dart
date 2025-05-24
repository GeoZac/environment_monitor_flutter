const double minLatitudeValue = -90;
const double maxLatitudeValue = 90;

const double minLongitudeValue = -180;
const double maxLongitudeValue = 180;

String? validateLatitudeValue(String minLimitValue) {
  double? minLimit = double.tryParse(minLimitValue);
  if (minLimit == null) {
    return "Should be within $minLatitudeValue and $maxLatitudeValue";
  }
  if (minLimit < minLatitudeValue) {
    return "Should be more than $minLatitudeValue";
  }
  if (minLimit >= maxLatitudeValue) {
    return "Should be less than $maxLatitudeValue";
  }
  return null;
}

String? validateLongitudeValue(String minLimitValue) {
  double? minLimit = double.tryParse(minLimitValue);
  if (minLimit == null) {
    return "Should be within $minLongitudeValue and $maxLongitudeValue";
  }
  if (minLimit < minLongitudeValue) {
    return "Should be more than $minLongitudeValue";
  }
  if (minLimit >= maxLongitudeValue) {
    return "Should be less than $maxLongitudeValue";
  }
  return null;
}
