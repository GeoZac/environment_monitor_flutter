import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../consts/sensor_status.dart';
import '../models/sensor_location/sensor_location.dart';
import '../models/sensor_system/sensor_system.dart';
import '../models/threshold/threshold.dart' as u_threshold;
import '../models/user/unconv_user.dart';
import 'humidity_limits.dart';
import 'temperature_limits.dart';

class SensorSystemForm extends StatefulWidget {
  final List<SensorLocation> existingSensorLocations;
  final UnconvUser unconvUser;
  final Function(SensorSystem) onSubmit;

  const SensorSystemForm({
    super.key,
    required this.existingSensorLocations,
    required this.unconvUser,
    required this.onSubmit,
  });

  @override
  State<SensorSystemForm> createState() => _SensorSystemFormState();
}

class _SensorSystemFormState extends State<SensorSystemForm> {
  final _formKey = GlobalKey<FormState>();
  late String sensorName;
  String? description;
  bool deleted = false;
  SensorStatus sensorStatus = SensorStatus.active;
  SensorLocation? sensorLocation;
  u_threshold.Threshold? humidityThreshold;
  u_threshold.Threshold? temperatureThreshold;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SensorSystem newSensorSystem = SensorSystem(
        sensorName: sensorName,
        description: description,
        deleted: deleted,
        sensorStatus: sensorStatus,
        sensorLocation: sensorLocation?.id == "-1" ? null : sensorLocation,
        unconvUser: widget.unconvUser,
      );
      widget.onSubmit(newSensorSystem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormSectionTitle(titleString: "Device details *"),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Sensor Name *',
                        border: outlineInputBorder8(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a sensor name' : null,
                      onSaved: (value) => sensorName = value!,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      maxLength: 500,
                      maxLines: 3,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Description (Optional)',
                        border: outlineInputBorder8(),
                      ),
                      onSaved: (value) => description = value,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const FormSectionTitle(
                              titleString: "Location details *"),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Add new",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                    DropdownButtonFormField<SensorLocation>(
                      decoration:
                          InputDecoration(border: outlineInputBorder8()),
                      hint: const Text("Select a Sensor Location"),
                      items: widget.existingSensorLocations
                          .map((sensorLocation) => DropdownMenuItem(
                                value: sensorLocation,
                                child: Text(sensorLocation.locationToString()),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => sensorLocation = value),
                    ),
                    const SizedBox(height: 16),
                    TemperatureLimits(
                      onSaved: (maxTemperature, minTemperature) {
                        // Use the values if both are provided
                        if (maxTemperature != null && minTemperature != null) {
                          temperatureThreshold = u_threshold.Threshold(
                            minValue: minTemperature,
                            maxValue: maxTemperature,
                          );
                        } else {
                          humidityThreshold = null;
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    HumidityLimits(
                      onSaved: (maxHumidity, minHumidity) {
                        // Use the values if both are provided
                        if (maxHumidity != null && minHumidity != null) {
                          humidityThreshold = u_threshold.Threshold(
                            minValue: minHumidity,
                            maxValue: maxHumidity,
                          );
                        } else {
                          humidityThreshold = null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    submitForm();
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FormSectionTitle extends StatelessWidget {
  final String titleString;
  const FormSectionTitle({super.key, required this.titleString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        titleString,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder8() {
  return OutlineInputBorder(borderRadius: BorderRadius.circular(8));
}
