import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../models/envt_reading/envt_reading.dart';
import '../models/envt_reading/envt_reading_response.dart';
import '../models/sensor_system/sensor_system.dart';
import '../providers/environmental_reading_provider.dart';
import '../widgets/common/center_circular_progress.dart';
import '../widgets/sensor_reading_card.dart';

class SensorReadings extends StatefulWidget {
  static const routeName = '/sensor_readings';

  final SensorSystemDTO selectedSensor;

  const SensorReadings({super.key, required this.selectedSensor});

  @override
  State<SensorReadings> createState() => _SensorReadingsState();
}

class _SensorReadingsState extends State<SensorReadings> {
  bool _init = false;

  List<EnvironmentalReading>? environmentalReadings;

  late EnvironmentalReadingResponse environmentalReadingResponse;

  @override
  void initState() {
    super.initState();
    fetchSensorReadings(widget.selectedSensor.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Readings'),
      ),
      body: (_init)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sensor Name",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const Divider(),
                          Text(
                            widget.selectedSensor.sensorName,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: environmentalReadings!.length,
                      itemBuilder: (BuildContext context, int index) {
                        EnvironmentalReading environmentalReading =
                            environmentalReadings![index];
                        return SensorReadingCard(
                            environmentalReading: environmentalReading);
                      }),
                ),
              ],
            )
          : const CenteredCircularProgress(),
    );
  }

  void fetchSensorReadings(String selectedSensorSystemId) {
    // fetchReadings() {
    EnvironmentalReadingProvider environmentalReadingProvider =
        EnvironmentalReadingProvider(
      http.Client(),
    );
    _init = false;
    environmentalReadingProvider
        .fetchEnvironmentalReadingsOfSpecificSensor(selectedSensorSystemId)
        .then((value) {
      environmentalReadingResponse = value;
      environmentalReadings =
          environmentalReadingResponse.data.cast<EnvironmentalReading>();

      setState(() {
        _init = true;
      });
    });
  }

  String formatTimestamp(String timestamp) {
    final date = DateTime.parse(timestamp).toLocal();
    final formatter = DateFormat('dd/MM/yy hh:mm');
    return formatter.format(date);
  }
}
