import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/misc/recent_readings.dart';
import '../providers/sensor_system_provider.dart';
import 'recent_readings_row.dart';

class RecentReadingsCard extends StatefulWidget {
  final String sensorSystemId;

  const RecentReadingsCard({
    super.key,
    required this.sensorSystemId,
  });

  @override
  State<RecentReadingsCard> createState() => _RecentReadingsCardState();
}

class _RecentReadingsCardState extends State<RecentReadingsCard> {
  bool _init = false;
  bool isViewExpanded = false;

  late RecentReadings recentReadings;

  @override
  void initState() {
    super.initState();
    fetchRecentSensorReadings();
  }

  @override
  Widget build(BuildContext context) {
    return !_init
        ? Container()
        : Card(
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent reading count",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isViewExpanded ? 20 : 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      expandReadingInfo();
                    },
                    icon: Icon(
                        isViewExpanded ? Icons.expand_less : Icons.expand_more),
                  )
                ],
              ),
              if (isViewExpanded)
                RecentReadingsRow(
                  recentReadings: recentReadings,
                ),
            ]),
          ));
  }

  void fetchRecentSensorReadings() {
    SensorSystemProvider sensorSystemProvider = SensorSystemProvider(
      http.Client(),
    );

    _init = false;
    sensorSystemProvider
        .fetchRecentReadings(widget.sensorSystemId)
        .then((value) {
      setState(() {
        recentReadings = value;
        _init = true;
      });
    });
  }

  void expandReadingInfo() {
    setState(() {
      isViewExpanded = !isViewExpanded;
    });
  }
}
