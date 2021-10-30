import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/subscreens/your_calendar_screen.dart';

void main() {
  group("Your Calendar Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_your_calendar_screen_view",
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.calendar_today_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(YourCalendarScreen),
          matchesGoldenFile('goldens/settings_your_calendar_screen_view.png'));
    });
  });
}
