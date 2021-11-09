import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/profile/subscreens/calendar_screen.dart';

void main() {
  group("Calendar Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("profile_calendar_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      List<String> creds = await TestAuth().getAuthCredentials();
      await TestAuth().authenticateTest(tester, creds);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.calendar_today_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(CalendarScreen),
          matchesGoldenFile('goldens/profile_calendar_screen_view.png'));
    });
  });
}
