// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../consts/sensor_location_type.dart';
import '../forms/sensor_system.dart';
import '../models/sensor_location/sensor_location.dart';
import '../models/sensor_system/sensor_system.dart';
import '../models/user/unconv_user.dart';
import '../providers/sensor_location_provider.dart';
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
        title: const Text('Add New Sensor Form'),
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

  List<DropdownMenuEntry<SensorLocation>> getSensorLocationDropDownEntries() {
    List<DropdownMenuEntry<SensorLocation>> existingSensorLocationsList =
        existingSensorLocations.map((SensorLocation sensorLocation) {
      return DropdownMenuEntry<SensorLocation>(
        value: sensorLocation,
        label: sensorLocation.locationToString(),
      );
    }).toList();

    existingSensorLocationsList.insert(
        0,
        DropdownMenuEntry(
            value: SensorLocation(
              id: "-1",
              sensorLocationText: "No sensor location",
              latitude: 0,
              longitude: 0,
              sensorLocationType: SensorLocationType.indoor,
            ),
            label: "No location"));

    return existingSensorLocationsList;
  }

  createNewSensorSystem(SensorSystem sensorSystem) {}
}

OutlineInputBorder outlineInputBorder8() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
    8,
  ));
}

class FormSectionTitle extends StatelessWidget {
  final String titleString;

  const FormSectionTitle({
    super.key,
    required this.titleString,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Text(
        titleString,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
