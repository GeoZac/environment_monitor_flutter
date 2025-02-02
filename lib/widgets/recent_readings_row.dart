import 'package:flutter/material.dart';

import '../models/misc/recent_readings.dart';

class RecentReadingsRow extends StatelessWidget {
  const RecentReadingsRow({
    super.key,
    required this.recentReadings,
  });

  final RecentReadings recentReadings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RecentReadingColumn(
          recentReadings: recentReadings.i1!,
          recentReadingInterval: "1 hour",
        ),
        RecentReadingColumn(
          recentReadings: recentReadings.i3!,
          recentReadingInterval: "3 hours",
        ),
        RecentReadingColumn(
          recentReadings: recentReadings.i8!,
          recentReadingInterval: "8 hours",
        ),
        RecentReadingColumn(
          recentReadings: recentReadings.i24!,
          recentReadingInterval: "1 day",
        ),
        RecentReadingColumn(
          recentReadings: recentReadings.i168!,
          recentReadingInterval: "1 week",
        ),
      ],
    );
  }
}

class RecentReadingColumn extends StatelessWidget {
  final int recentReadings;
  final String recentReadingInterval;
  final double fontSize = 16;

  const RecentReadingColumn({
    super.key,
    required this.recentReadings,
    required this.recentReadingInterval,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          recentReadingInterval,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
        Text(recentReadings.toString(),
            style: TextStyle(
              fontSize: fontSize,
            ))
      ],
    );
  }
}
