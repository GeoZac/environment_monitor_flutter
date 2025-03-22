import 'package:flutter/material.dart';

class SensorLocationForm extends StatefulWidget {
  const SensorLocationForm({
    super.key,
  });

  @override
  State<SensorLocationForm> createState() => _SensorLocationFormState();
}

class _SensorLocationFormState extends State<SensorLocationForm> {
  final _formKey = GlobalKey<FormState>();

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
                      keyboardType: TextInputType.number,
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
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Longitude',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
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
