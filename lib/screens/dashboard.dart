import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/sensor_system/sensor_system.dart';
import '../models/sensor_system/sensor_system_response.dart';
import '../models/user/unconv_user.dart';
import '../widgets/common/center_circular_progress.dart';
import '../widgets/dashboard_sensor_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.unconvUser});

  static const routeName = '/dashboard';

  final UnconvUser unconvUser;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final bool _init = false;
  late List<SensorSystem> sensorSystems;
  late SensorSystemResponse sensorSystemResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Environment Monitor"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.greenAccent[400],
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: (_init)
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                    ),
                                    child: Text(
                                      sensorSystemResponse.totalElements
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 64,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    "Active Sensors",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(
                      thickness: 4,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sensors",
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Divider(
                      thickness: 4,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sensorSystems.length,
                      itemBuilder: (context, index) {
                        return SensorSystemDashboardCard(
                            sensorSystem: sensorSystems[index]);
                      },
                    ),
                  )
                ],
              ),
            )
          : CenteredCircularProgress(),
    );
  }
}
