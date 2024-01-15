// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../consts/color_consts.dart';
import '../main.dart';
import '../models/sensor_system/sensor_system_dto.dart';
import '../screens/sensor_readings.dart';
import '../widgets/sensor_location_container.dart';
import 'sensor_reading_container.dart';

class SensorSystemDashboardCard extends StatelessWidget {
  const SensorSystemDashboardCard({
    super.key,
    required this.sensorSystem,
  });

  final SensorSystemDTO? sensorSystem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        12.0,
      ),
      child: Card(
          shadowColor: ColorConstants.backgroundColor,
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorConstants.mutedIconColor,
            ),
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  sensorSystem!.sensorName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: ColorConstants.textColorBlack,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (sensorSystem!.sensorLocation != null)
                                  SensorLocationContainer(
                                    sensorSystem: sensorSystem,
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
                      const Divider(
                        thickness: 2,
                      ),
                      Text(
                        "Reading Count : ${sensorSystem!.readingCount}",
                        style: TextStyle(
                          color: ColorConstants.textColorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (sensorSystem!.latestReading != null)
                        const Text(
                          "Latest reading",
                          style: TextStyle(
                            color: ColorConstants.textColorBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (sensorSystem!.latestReading != null)
                        SensorReadingContainer(
                          temperature: sensorSystem!.latestReading!.temperature,
                          humidity: sensorSystem!.latestReading!.humidity,
                        )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
