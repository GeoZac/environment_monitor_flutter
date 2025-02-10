// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/user/unconv_user.dart';

class SensorSystemForm extends StatefulWidget {
  static const routeName = '/sensorSystemForm';

  final UnconvUser unconvUser;

  const SensorSystemForm({
    super.key,
    required this.unconvUser,
  });

  @override
  State<SensorSystemForm> createState() => _SensorSystemFormState();
}

class _SensorSystemFormState extends State<SensorSystemForm> {
  bool _init = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Sensor Form'),
        ),
        body: Column(
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
