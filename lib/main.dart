import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/environmental_reading_provider.dart';
import 'providers/sensor_system_provider.dart';
import 'providers/unconv_api_provider.dart';

void main() {
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
            create: (context) => EnvironmentalReadingProvider()),
        ChangeNotifierProvider(create: (context) => SensorSystemProvider()),
        ChangeNotifierProvider(create: ((context) => UnconvApiProvider())),
      ],
      child: MaterialApp(
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
