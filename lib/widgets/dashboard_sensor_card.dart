import 'package:flutter/material.dart';

import '../main.dart';
import '../models/sensor_system/sensor_system.dart';
import '../screens/sensor_readings.dart';

class SensorSystemDashboardCard extends StatelessWidget {
  const SensorSystemDashboardCard({
    super.key,
    required this.sensorSystem,
  });

  final SensorSystem? sensorSystem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sensorSystem!.sensorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    sensorSystem!.id,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_right,
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SensorReadings.routeName,
                  arguments: ScreenArguments(
                    sensorSystem!,
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
