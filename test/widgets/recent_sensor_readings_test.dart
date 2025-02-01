import 'dart:convert';

import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:environment_monitor/widgets/recent_sensor_readings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  testWidgets('Displays loading spinner while data is being fetched',
      (WidgetTester tester) async {
    // Arrange
    Map<String, dynamic> jsonData = {
      '1': 10,
      '3': 20,
      '8': 30,
      '24': 40,
      '168': 50,
    };

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 200);
    });

    // Act
    await tester.pumpWidget(MaterialApp(
      home: RecentReadingsCard(sensorSystemId: '', httpClient: mockClient),
    ));

    // Assert
    expect(find.byType(CenteredCircularProgress), findsOneWidget);
  });
}
