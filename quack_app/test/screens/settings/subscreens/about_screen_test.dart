import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/subscreens/about_screen.dart';

void main() {
  group("About Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_about_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.accessibility_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(AboutScreen),
          matchesGoldenFile('goldens/settings_about_screen_view.png'));
    });
  });
}
