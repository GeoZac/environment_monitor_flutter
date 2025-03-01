import 'package:flutter/material.dart';

import '../utils/sensor_form_helpers.dart';
import 'sensor_system.dart';

class HumidityLimits extends StatefulWidget {
  final Function(double? maxHumidity, double? minHumidity) onSaved;

  const HumidityLimits({
    super.key,
    required this.onSaved,
  });

  @override
  State<HumidityLimits> createState() => _HumidityLimitsState();
}

class _HumidityLimitsState extends State<HumidityLimits> {
  final TextEditingController _maxHumidityController = TextEditingController();
  final TextEditingController _minHumidityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _maxHumidityController.addListener(_onTextChange);
    _minHumidityController.addListener(_onTextChange);
  }

  void _onTextChange() {
    double? maxHumidity = double.tryParse(_maxHumidityController.text);
    double? minHumidity = double.tryParse(_minHumidityController.text);

    // Save values whenever text changes
    widget.onSaved(maxHumidity, minHumidity);
  }

  @override
  void dispose() {
    _maxHumidityController.dispose();
    _minHumidityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('humidityLimitsColumn'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormSectionTitle(titleString: "Humidity limits"),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                key: const Key('maxHumidityField'),
                controller: _maxHumidityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  labelText: 'Max. limit',
                  border: outlineInputBorder8(),
                ),
                validator: (value) => validateHumidityValue(value),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                key: const Key('minHumidityField'),
                controller: _minHumidityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  labelText: 'Min limit',
                  border: outlineInputBorder8(),
                ),
                validator: (value) => validateHumidityValue(value),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
