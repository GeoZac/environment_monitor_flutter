import 'dart:convert';

import 'package:environment_monitor/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Login button is disabled initially',
      (WidgetTester tester) async {
    Map<String, dynamic> jsonData = {
    };

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 200);
    });
    await tester.pumpWidget(MaterialApp(
        home: LoginScreen(
      httpClient: mockClient,
    )));

    final loginButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(loginButton.onPressed, isNull);
  });

  testWidgets('Entering text enables login button',
      (WidgetTester tester) async {
    Map<String, dynamic> jsonData = {
    };

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 200);
    });
    await tester.pumpWidget(MaterialApp(
        home: LoginScreen(
      httpClient: mockClient,
    )));

    await tester.enterText(find.byType(TextFormField).first, 'testUser');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.pump();

    final loginButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(loginButton.onPressed, isNotNull);
  });
}
