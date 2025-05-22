import 'dart:convert';

import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_dto.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/navigation/sensor_readings_screen_arguments.dart';
import 'package:environment_monitor/screens/sensor_readings.dart';
import 'package:environment_monitor/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  Map<String, dynamic> jsonData = {
    "isFirst": true,
    "isLast": true,
    "hasNext": false,
    "hasPrevious": false,
    "data": [],
    "totalElements": 0,
    "pageNumber": 1,
    "totalPages": 1
  };

  final mockClient = MockClient((request) async {
    return http.Response(
      jsonEncode(jsonData),
      200,
    );
  });

  final routeFactory = createRouteFactory(mockClient);

  test('returns SensorReadings route when name matches', () {
    final sensor = SensorSystemDTO(
      id: "508baef0-bc82-4481-9af8-83d2e5132100",
      sensorName: "Test Sensor",
      deleted: false,
      sensorStatus: SensorStatus.active,
      unconvUser: UnconvUser(
        id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
        username: "Test User",
        email: "test@example.com",
        accountNonExpired: true,
        accountNonLocked: true,
        credentialsNonExpired: true,
        enabled: true,
        authorities: [
          UnconvAuthority.unconvUser,
        ],
      ),
      readingCount: 0,
      createdDate: "2024-02-29T14:57:56.795247158Z",
      updatedDate: "2025-01-23T12:57:56.795270236Z",
    );
    final settings = RouteSettings(
      name: SensorReadings.routeName,
      arguments: SensorReadingsScreenArguments(sensor),
    );

    final route = routeFactory(settings)!;
    expect(route, isA<MaterialPageRoute>());
    expect((route as MaterialPageRoute).builder, isNotNull);
  });
}
