import 'package:flutter/material.dart';

import '../forms/sensor_location.dart';
import '../models/sensor_location/sensor_location.dart';

class _LocationBottomSheet extends StatefulWidget {
  final void Function(SensorLocation) addSensorLocation;

  const _LocationBottomSheet({
    super.key,
    required this.addSensorLocation,
  });
  @override
  _LocationBottomSheetState createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<_LocationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 24.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24.0,
      ),
      child: SingleChildScrollView(
        child: SensorLocationForm(
          addSensorLocation: addSensorLocation,
        ),
      ),
    );
  }

  void addSensorLocation(SensorLocation sensorLocation) {
    widget.addSensorLocation(
      sensorLocation,
    );
  }
}

void showLocationBottomSheet(
  BuildContext context, {
  required Function(SensorLocation sensorLocation) addSensorLocation,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(
        16.0,
      )),
    ),
    isScrollControlled: true,
    builder: (context) => _LocationBottomSheet(
      addSensorLocation: addSensorLocation,
    ),
  );
}
