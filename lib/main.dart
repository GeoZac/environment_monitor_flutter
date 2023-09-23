import 'package:bugsnag_flutter/bugsnag_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'config/globals.dart';
import 'config/secrets.dart';
import 'models/sensor_system/sensor_system_dto.dart';
import 'providers/environmental_reading_provider.dart';
import 'providers/sensor_system_provider.dart';
import 'providers/unconv_api_provider.dart';
import 'screens/login.dart';
import 'screens/sensor_readings.dart';

Future<void> main() async {
  if (Globals.analyticsEnabled) {
    await bugsnag.start(apiKey: Secrets.bugSnagKey);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => EnvironmentalReadingProvider(
                  http.Client(),
                )),
        ChangeNotifierProvider(
            create: (context) => SensorSystemProvider(
                  http.Client(),
                )),
        ChangeNotifierProvider(
            create: ((context) => UnconvApiProvider(
                  http.Client(),
                ))),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == SensorReadings.routeName) {
            final args = settings.arguments as ScreenArguments;
            return MaterialPageRoute(
              builder: (context) {
                return SensorReadings(
                  selectedSensor: args.sensorSystem,
                );
              },
            );
          }
          return null;
        },
        title: 'Environment Monitor',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Environment Monitor',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ScreenArguments {
  final SensorSystemDTO sensorSystem;

  ScreenArguments(this.sensorSystem);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
