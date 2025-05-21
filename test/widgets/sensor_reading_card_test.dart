import 'package:environment_monitor/consts/color_consts.dart';
import 'package:environment_monitor/consts/sensor_status.dart';
import 'package:environment_monitor/consts/unconv_authority.dart';
import 'package:environment_monitor/models/envt_reading/envt_reading.dart';
import 'package:environment_monitor/models/sensor_system/sensor_system_dto.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/widgets/sensor_reading_card.dart';
import 'package:environment_monitor/widgets/sensor_reading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('SensorReadingCard', () {
    testWidgets('displays formatted date and time',
        (WidgetTester tester) async {
      // Create a sample EnvironmentalReading object
      final environmentalReading = EnvironmentalReading(
        id: "0002d2ce-6441-4975-bdb9-a55667ebfb23",
        temperature: 25.0,
        humidity: 50.0,
        timestamp: "2023-06-21T22:10:29Z",
        sensorSystem: SensorSystemDTO(
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
        ),
      );
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorReadingCard(
              environmentalReading: environmentalReading,
            ),
          ),
        ),
      );

      Intl.defaultLocale = 'en_US';

      final localDate =
          DateTime.parse(environmentalReading.timestamp).toLocal();
      final formattedDate = DateFormat('MMMM dd, yyyy').format(localDate);
      final formattedTime = DateFormat('hh:mm a').format(localDate);

      expect(find.text(formattedDate), findsOneWidget);
      expect(find.text(formattedTime), findsOneWidget);

      expect(find.byType(SensorReadingContainer), findsOneWidget);
    });

    testWidgets('displays correct styles for text',
        (WidgetTester tester) async {
      final environmentalReading = EnvironmentalReading(
        id: "0002d2ce-6441-4975-bdb9-a55667ebfb23",
        temperature: 25.0,
        humidity: 50.0,
        timestamp: "2023-06-21T22:10:29Z", // UTC timestamp
        sensorSystem: SensorSystemDTO(
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
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SensorReadingCard(
              environmentalReading: environmentalReading,
            ),
          ),
        ),
      );

      Intl.defaultLocale = 'en_US';

      final localDate =
          DateTime.parse(environmentalReading.timestamp).toLocal();
      final formattedDate = DateFormat('MMMM dd, yyyy').format(localDate);
      final formattedTime = DateFormat('hh:mm a').format(localDate);

      final dateTextFinder = find.text(formattedDate);
      expect(dateTextFinder, findsOneWidget);
      final dateText = tester.widget<Text>(dateTextFinder);
      expect(dateText.style?.color, ColorConstants.textColorBlack);
      expect(dateText.style?.fontSize, 24);
      expect(dateText.style?.fontWeight, FontWeight.bold);

      final timeTextFinder = find.text(formattedTime);
      expect(timeTextFinder, findsOneWidget);
      final timeText = tester.widget<Text>(timeTextFinder);
      expect(timeText.style?.color, ColorConstants.textColorMuted);
      expect(timeText.style?.fontSize, 16);
    });
  });
}
