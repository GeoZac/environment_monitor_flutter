import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts/sensor_location_type.dart';
import '../models/sensor_location/sensor_location.dart';

class SensorLocationForm extends StatefulWidget {
  final void Function(SensorLocation) addSensorLocation;

  const SensorLocationForm({
    super.key,
    required this.addSensorLocation,
  });

  @override
  State<SensorLocationForm> createState() => _SensorLocationFormState();
}

class _SensorLocationFormState extends State<SensorLocationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _locationNameController = TextEditingController();
  SensorLocationType _locationType = SensorLocationType.outdoor;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final SensorLocation sensorLocation = SensorLocation(
        sensorLocationText: _locationNameController.text,
        latitude: double.parse(
          _latitudeController.text,
        ),
        longitude: double.parse(
          _longitudeController.text,
        ),
        sensorLocationType: _locationType,
      );

      widget.addSensorLocation(
        sensorLocation,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('sensorLocationForm'),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'New Location',
            key: Key('titleText'),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Center(
          child: Text(
            'Enter Sensor area location values below',
            key: Key('subtitleText'),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Form(
          key: _formKey,
          child: Column(
            key: const Key('formFields'),
            children: [
              TextField(
                key: const Key('locationNameField'),
                controller: _locationNameController,
                decoration: const InputDecoration(
                  labelText: 'Location Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      key: const Key('latitudeField'),
                      controller: _latitudeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]*[.]?[0-9]*'))
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Latitude',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      key: const Key('longitudeField'),
                      controller: _longitudeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]*[.]?[0-9]*'))
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Longitude',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              DropdownButtonFormField<SensorLocationType>(
                value: _locationType,
                items: SensorLocationType.values
                    .map((SensorLocationType locationType) {
                  return DropdownMenuItem<SensorLocationType>(
                    value: locationType,
                    child: Text(locationType.name),
                  );
                }).toList(),
                onChanged: (SensorLocationType? newValue) {
                  setState(() {
                    _locationType = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Location Type',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const Divider(
          key: Key('divider'),
        ),
        Row(
          key: const Key('actionButtons'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              key: const Key('cancelButton'),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              key: const Key('addLocationButton'),
              onPressed: () {
                submitForm();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
              ),
              child: const Text('Add Location'),
            ),
          ],
        ),
      ],
    );
  }
}
