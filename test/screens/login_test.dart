import 'dart:convert';

import 'package:environment_monitor/screens/dashboard.dart';
import 'package:environment_monitor/screens/login.dart';
import 'package:environment_monitor/utils/token_singleton.dart';
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
    Map<String, dynamic> jsonData = {};

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 200);
    });
    await tester.pumpWidget(MaterialApp(
        home: LoginScreen(
      httpClient: mockClient,
    )));

    final sensorIconFinder = find.byKey(const Key('sensor_svg_icon'));
    expect(sensorIconFinder, findsOneWidget);

    final loginButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(loginButton.onPressed, isNull);
  });

  testWidgets('Entering text enables login button',
      (WidgetTester tester) async {
    Map<String, dynamic> jsonData = {};

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

  testWidgets('Tapping login button calls API and navigates on success',
      (WidgetTester tester) async {
    Map<String, dynamic> authData = {
      "expires": 3600,
      "unconvUser": {
        "id": "6b7e32a7-0c42-4bf4-95d0-e6e2c4d1e3e7",
        "username": "test_user",
        "email": "test_user@email.com",
        "accountNonExpired": true,
        "accountNonLocked": true,
        "credentialsNonExpired": true,
        "enabled": true,
        "authorities": [
          {'authority': 'UNCONV_USER'},
        ],
      },
      "token":
          "hICKORYdICKORYdOCK_THEmOUSErANupTHecLOCK_tHEcLOCKSTRUCKONE_THEmOUSErANdown_hICKORYdICKORYdOCK"
    };

    Map<String, dynamic> sensorData = {
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
      if (request.url.path.contains('/auth/login')) {
        return http.Response(jsonEncode(authData), 200);
      } else if (request.url.path.contains('/SensorSystem/UnconvUser/')) {
        return http.Response(jsonEncode(sensorData), 200);
      }
      return http.Response('Not Found', 404);
    });

    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(
        httpClient: mockClient,
      ),
    ));

    await tester.enterText(find.byType(TextFormField).first, 'testUser');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(TokenSingleton().bearerToken,
        'hICKORYdICKORYdOCK_THEmOUSErANupTHecLOCK_tHEcLOCKSTRUCKONE_THEmOUSErANdown_hICKORYdICKORYdOCK');
    expect(find.byType(Dashboard), findsOneWidget);
  });

  testWidgets('Invalid login shows error message', (WidgetTester tester) async {
    Map<String, dynamic> jsonData = {};

    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode(jsonData), 401);
    });
    await tester.pumpWidget(MaterialApp(
        home: LoginScreen(
      httpClient: mockClient,
    )));

    await tester.enterText(find.byType(TextFormField).first, 'wrongUser');
    await tester.enterText(find.byType(TextFormField).last, 'wrongPassword');
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Invalid User Name or Password!'), findsOneWidget);
  });
}
