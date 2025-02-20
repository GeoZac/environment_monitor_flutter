import 'package:environment_monitor/forms/sensor_system.dart';
import 'package:flutter/material.dart';

class HumidityLimits extends StatefulWidget {
  final Function(double? maxHumidity, double? minHumidity) onSaved;

  const HumidityLimits({super.key, required this.onSaved});

  @override
  State<HumidityLimits> createState() => _HumidityLimitsState();
}

class _HumidityLimitsState extends State<HumidityLimits> {
  final TextEditingController _maxHumidityController = TextEditingController();
  final TextEditingController _minHumidityController = TextEditingController();

  void saveValues() {
    double? maxHumidity = double.tryParse(_maxHumidityController.text);
    double? minHumidity = double.tryParse(_minHumidityController.text);

    // Only save values if both fields are filled
    if (maxHumidity != null && minHumidity != null) {
      widget.onSaved(maxHumidity, minHumidity);
    } else {
      widget.onSaved(null, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormSectionTitle(titleString: "Humidity limits"),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _maxHumidityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  labelText: 'Max. limit',
                  border: outlineInputBorder8(),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _minHumidityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  labelText: 'Min limit',
                  border: outlineInputBorder8(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
