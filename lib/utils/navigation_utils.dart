import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../navigation/sensor_readings_screen_arguments.dart';
import '../screens/sensor_readings.dart';

RouteFactory createRouteFactory(http.Client httpClient) {
  return (RouteSettings settings) {
    if (settings.name == SensorReadings.routeName) {
      final args = settings.arguments as SensorReadingsScreenArguments;
      return MaterialPageRoute(
        builder: (context) {
          return SensorReadings(
            selectedSensor: args.sensorSystem,
            httpClient: http.Client(),
          );
        },
      );
    }
    return null;
  };
}
