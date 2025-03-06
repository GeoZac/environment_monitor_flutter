// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../forms/sensor_system.dart';
import '../models/sensor_location/sensor_location.dart';
import '../models/sensor_system/sensor_system.dart';
import '../models/user/unconv_user.dart';
import '../providers/sensor_location_provider.dart';
import '../providers/sensor_system_provider.dart';
import '../widgets/common/center_circular_progress.dart';

class AddSensorSystem extends StatefulWidget {
  static const routeName = '/addSensorSystem';

  final UnconvUser unconvUser;

  const AddSensorSystem({
    super.key,
    required this.unconvUser,
  });

  @override
  State<AddSensorSystem> createState() => _AddSensorSystemState();
}

class _AddSensorSystemState extends State<AddSensorSystem> {
  bool _init = false;

  late List<SensorLocation> existingSensorLocations;

  @override
  void initState() {
    super.initState();

    fetchSensorLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Sensor',
        ),
      ),
      body: (!_init)
          ? const CenteredCircularProgress()
          : SensorSystemForm(
              existingSensorLocations: existingSensorLocations,
              unconvUser: widget.unconvUser,
              onSubmit: createNewSensorSystem,
            ),
    );
  }

  void fetchSensorLocations() {
    _init = false;
    SensorLocationProvider sensorSystemProvider = SensorLocationProvider(
      http.Client(),
    );
    sensorSystemProvider
        .fetchSensorLocations(widget.unconvUser.id)
        .then((response) {
      existingSensorLocations = response;

      setState(() {
        _init = true;
      });
    });
  }

  void createNewSensorSystem(SensorSystem sensorSystem) {
    _init = false;
    SensorSystemProvider sensorSystemProvider = SensorSystemProvider(
      http.Client(),
    );

    sensorSystemProvider.createSensorSystem(sensorSystem).then((response) {
      setState(() {
        _init = true;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully created sensor system')),
        );
      }

      if (mounted) {
        Navigator.pop(
          context,
          true,
        );
      }
    });
  }
}
