import 'package:flutter/material.dart';

import '../consts/color_consts.dart';

class SensorReadingContainer extends StatelessWidget {
  final double temperature;
  final double humidity;

  const SensorReadingContainer({
    Key? key,
    required this.temperature,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              SensorReadingContainerTitle(
                title: "${temperature.toStringAsFixed(2)} \u2103",
              ),
              const SensorReadingContainerSubTitle(
                subTitle: "Temperature",
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: SizedBox(
                height: 50,
                width: 2,
                child: VerticalDivider(
                  thickness: 2,
                )),
          ),
          Column(
            children: [
              SensorReadingContainerTitle(
                title: "${humidity.toStringAsFixed(2)} %",
              ),
              const SensorReadingContainerSubTitle(
                subTitle: "Humidity",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SensorReadingContainerTitle extends StatelessWidget {
  const SensorReadingContainerTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: ColorConstants.textColorGreen,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SensorReadingContainerSubTitle extends StatelessWidget {
  final String subTitle;

  const SensorReadingContainerSubTitle({
    Key? key,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: const TextStyle(
        color: ColorConstants.textColorMuted,
        fontSize: 16,
      ),
    );
  }
}
