import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../screens/sensor_readings.dart';

RouteFactory createRouteFactory(http.Client httpClient) {
  return (RouteSettings settings) {
    if (settings.name == SensorReadings.routeName) {
      final args = settings.arguments as ScreenArguments;
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
