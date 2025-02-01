import 'dart:convert';

import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:environment_monitor/widgets/recent_readings_row.dart';
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

  testWidgets('Displays sensor readings after data is fetched',
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
      home: RecentReadingsCard(
        sensorSystemId: '',
        httpClient: mockClient,
      ),
    ));

    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Recent reading count'), findsOneWidget);
  });

  testWidgets('Tapping expand icon toggles view', (WidgetTester tester) async {
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

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RecentReadingsCard(
            sensorSystemId: '123',
            httpClient: mockClient,
          ),
        ),
      ),
    );

    // Wait for the future to complete
    await tester.pump();

    // Find the expand icon
    final expandIcon = find.byIcon(Icons.expand_more);
    expect(expandIcon, findsOneWidget);

    // Tap the expand icon
    await tester.tap(expandIcon);
    await tester.pump();

    // Verify that the expanded content is displayed
    expect(find.byType(RecentReadingsRow), findsOneWidget);

    // Find the collapse icon
    final collapseIcon = find.byIcon(Icons.expand_less);
    expect(collapseIcon, findsOneWidget);

    // Tap the collapse icon
    await tester.tap(collapseIcon);
    await tester.pump();

    // Verify that the expanded content is hidden
    expect(find.byType(RecentReadingsRow), findsNothing);
  });
}
