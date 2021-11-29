import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/subscreens/notifications_preferences_screen.dart';

void main() {
  group("Notifications Preferences Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_notifications_preferences_screen_view",
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.notifications_active_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(NotificationsPreferencesScreen),
          matchesGoldenFile(
              'goldens/settings_notifications_preferences_screen_view.png'));
    });
  });
}
