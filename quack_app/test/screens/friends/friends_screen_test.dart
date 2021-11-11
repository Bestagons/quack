import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/friends/friends_screen.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  List<String> creds = await TestAuth().getAuthCredentials();
  group("Friends Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("friends_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await TestAuth().authenticateTest(tester, creds);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await expectLater(find.byType(FriendsScreen),
          matchesGoldenFile('goldens/friends_screen_view.png'));
    });

    testGoldens("friends_not_sharing_loc_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await TestAuth().authenticateTest(tester, creds);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.scrollUntilVisible(find.text("Batman"), 10);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await expectLater(find.byType(FriendsScreen),
          matchesGoldenFile('goldens/friends_not_sharing_loc_view.png'));
    });
  });
}
