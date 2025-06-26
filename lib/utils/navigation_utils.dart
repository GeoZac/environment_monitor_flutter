import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../navigation/sensor_readings_screen_arguments.dart';
import '../navigation/sensor_system_form_arguments.dart';
import '../screens/sensor_readings.dart';
import '../screens/sensor_system_form.dart';

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
    } else if (settings.name == AddSensorSystem.routeName) {
      final args = settings.arguments as SensorSystemFormArguments;
      return MaterialPageRoute(
        builder: (context) {
          return AddSensorSystem(
            unconvUser: args.unconvUser,
          );
        },
      );
    }
    return null;
  };
}
