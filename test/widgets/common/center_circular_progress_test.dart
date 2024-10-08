import 'package:environment_monitor/widgets/common/center_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CenteredCircularProgress displays CircularProgressIndicator',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CenteredCircularProgress(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(Center), findsOneWidget);
  });
}
