import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/envt_reading/envt_reading.dart';

class SensorReadingCard extends StatelessWidget {
  final EnvironmentalReading environmentalReading;

  final double fontSize = 20.0;

  const SensorReadingCard({
    super.key,
    required this.environmentalReading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatTimestamp(environmentalReading.timestamp),
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              children: [
                Text(
                  "Temperature",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${environmentalReading.temperature.toStringAsFixed(2)} \u2103",
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  "Humidity",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${environmentalReading.humidity.toStringAsFixed(2)} %",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatTimestamp(String timestamp) {
    final date = DateTime.parse(timestamp).toLocal();
    final formatter = DateFormat('EEE dd/MM/yy hh:mm a');
    return formatter.format(date);
  }
}
