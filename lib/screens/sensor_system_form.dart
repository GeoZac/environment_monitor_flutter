// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../consts/sensor_location_type.dart';
import '../models/sensor_location/sensor_location.dart';
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

  final _formKey = GlobalKey<FormState>();

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
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              FormSectionTitle(
                                titleString: "Device details *",
                              ),
                              TextFormField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: 'Sensor Name *',
                                  border: outlineInputBorder8(),
                                ),
                                validator: (String? newValue) {
                                  if (newValue == null || newValue.isEmpty) {
                                    return 'Please enter a sensor name';
                                  }
                                  return null;
                                },
                                onSaved: null,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                maxLength: 500,
                                maxLines: 3,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  labelText: 'Description (Optional)',
                                  border: outlineInputBorder8(),
                                ),
                                onSaved: null,
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.top,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FormSectionTitle(
                                      titleString: "Location details *",
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Add new",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              DropdownMenu<SensorLocation>(
                                hintText: "Select a Sensor Location",
                                enableSearch: true,
                                inputDecorationTheme: InputDecorationTheme(
                                  border: outlineInputBorder8(),
                                ),
                                dropdownMenuEntries:
                                    getSensorLocationDropDownEntries(),
                                onSelected: null,
                              ),
                              const SizedBox(
                                height: 16,
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
                          onPressed: null,
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
              ));
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
