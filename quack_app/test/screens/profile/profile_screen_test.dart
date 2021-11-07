import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/profile/profile_screen.dart';

void main() {
  group("Settings Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("profile_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      List<String> creds = await TestAuth().getAuthCredentials();
      await TestAuth().authenticateTest(tester, creds);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(ProfileScreen),
          matchesGoldenFile('goldens/profile_screen_view.png'));
    });
  });
}
