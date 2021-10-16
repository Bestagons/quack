import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/profile/subscreens/friends_screen.dart';

void main() {
  group("Friends Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("profile_friends_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.group_add_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(FriendsScreen),
          matchesGoldenFile('goldens/profile_friends_screen_view.png'));
    });
  });
}
