import 'dart:convert';

import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/screens/dashboard.dart';
import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  late UnconvUser unconvUser;

  setUp(() {
    unconvUser = UnconvUser(
      id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
      username: "Test User",
      email: "test@example.com",
    );
  });

  testWidgets('Displays loading spinner while data is being fetched',
      (WidgetTester tester) async {
    // Arrange
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

    // Act
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(
        httpClient: mockClient,
        unconvUser: unconvUser,
      ),
    ));

    // Assert
    expect(find.byType(CenteredCircularProgress), findsOneWidget);
    expect(find.text('Environment Monitor'), findsOneWidget);
  });
}
