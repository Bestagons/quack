import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/subscreens/account_preferences_screen.dart';

void main() {
  group("Account Preferences Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_account_preferences_screen",
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      List<String> creds = await TestAuth().getAuthCredentials();
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.account_circle_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(AccountPreferencesScreen),
          matchesGoldenFile('goldens/settings_account_preferences_screen.png'));
    });
  });
}
