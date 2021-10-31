import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/settings/settings_screen.dart';

void main() {
  group("Settings Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("settings_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      List<String> creds = await TestAuth().getAuthCredentials();
      await TestAuth().authenticateTest(tester, creds);
      await tester.tap(find.byIcon(Constants.kNavBarSettingsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(SettingsScreen),
          matchesGoldenFile('goldens/settings_screen_view.png'));
    });
  });
}
