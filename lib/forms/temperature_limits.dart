import 'package:flutter/material.dart';

import '../utils/sensor_form_helpers.dart';
import 'sensor_system.dart';

class TemperatureLimits extends StatefulWidget {
  final Function(double? maxTemperature, double? minTemperature) onSaved;

  const TemperatureLimits({
    super.key,
    required this.onSaved,
  });

  @override
  State<TemperatureLimits> createState() => _TemperatureLimitsState();
}

class _TemperatureLimitsState extends State<TemperatureLimits> {
  final TextEditingController _maxTemperatureController =
      TextEditingController();
  final TextEditingController _minTemperatureController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _maxTemperatureController.addListener(_onTextChange);
    _minTemperatureController.addListener(_onTextChange);
  }

  void _onTextChange() {
    double? maxTemperature = double.tryParse(_maxTemperatureController.text);
    double? minTemperature = double.tryParse(_minTemperatureController.text);

    // Save values whenever text changes
    widget.onSaved(maxTemperature, minTemperature);
  }

  @override
  void dispose() {
    _maxTemperatureController.dispose();
    _minTemperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormSectionTitle(titleString: "Temperature limits"),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                key: const Key('maxTemperatureField'),
                controller: _maxTemperatureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  labelText: 'Max. limit',
                  border: outlineInputBorder8(),
                ),
                validator: (value) => validateTemperatureValue(value!),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                key: const Key('minTemperatureField'),
                controller: _minTemperatureController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  labelText: 'Min limit',
                  border: outlineInputBorder8(),
                ),
                validator: (value) => validateTemperatureValue(value!),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
