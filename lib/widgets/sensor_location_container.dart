import 'package:flutter/material.dart';

import '../consts/color_consts.dart';
import '../models/sensor_system/sensor_system.dart';

class SensorLocationContainer extends StatelessWidget {
  const SensorLocationContainer({
    super.key,
    required this.sensorSystem,
  });

  final SensorSystem? sensorSystem;

  @override
  Widget build(BuildContext context) {
    if (sensorSystem!.sensorLocation == null) {
      return Container();
    }
    return Row(
      children: [
        const Icon(
          color: ColorConstants.textColorBlack,
          Icons.location_on_outlined,
          size: 16,
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Text(
            sensorSystem!.sensorLocation!.sensorLocationText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
