import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/subscreens/food_preferences_screen.dart';

void main() {
  group("Food Preferences Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_food_preferences_screen_view",
        (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      List<String> creds = await TestAuth().getAuthCredentials();
      await TestAuth().authenticateTest(tester, creds);
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.food_bank_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(FoodPreferencesScreen),
          matchesGoldenFile(
              'goldens/settings_food_preferences_screen_view.png'));
    });
  });
}
