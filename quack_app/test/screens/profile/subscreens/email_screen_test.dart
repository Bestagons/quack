import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/profile/subscreens/email_screen.dart';

void main() {
  group("Email Screen Test", () {
    MyApp app = const MyApp();
    testGoldens("profile_email_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Icons.alternate_email));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(EmailScreen),
          matchesGoldenFile('goldens/profile_email_screen_view.png'));
    });
  });
}
