import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/settings_screen.dart';
import 'package:quack_app/screens/settings/subscreens/notifications_prefrences_screen.dart';

void main() {
  group("Notifications Prefrences Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_notifications_prefrences_screen_view",
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.notifications_active_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(NotificationsPrefrencesScreen),
          matchesGoldenFile(
              'goldens/settings_notifications_prefrences_screen_view.png'));
    });
  });
}
