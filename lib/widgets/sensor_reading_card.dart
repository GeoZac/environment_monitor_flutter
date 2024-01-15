import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../consts/color_consts.dart';
import '../models/envt_reading/envt_reading.dart';
import 'sensor_reading_container.dart';

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
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ColorConstants.mutedIconColor),
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  formatTimestampAsDate(environmentalReading.timestamp),
                  style: const TextStyle(
                    color: ColorConstants.textColorBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  formatTimestampAsTime(environmentalReading.timestamp),
                  style: const TextStyle(
                    color: ColorConstants.textColorMuted,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            SensorReadingContainer(
              temperature: environmentalReading.temperature,
              humidity: environmentalReading.humidity,
            )
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

  String formatTimestampAsDate(String timestamp) {
    final date = DateTime.parse(timestamp).toLocal();
    final formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(date);
  }

  String formatTimestampAsTime(String timestamp) {
    final date = DateTime.parse(timestamp).toLocal();
    final formatter = DateFormat('hh:mm a');
    return formatter.format(date);
  }
}
