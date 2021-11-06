import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/login/login_screen.dart';

void main() async {
  group("Login Screen Test", () {
    testGoldens("basic_view", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await expectLater(find.byType(LoginScreen),
          matchesGoldenFile('goldens/basic_view.png'));
    });

    testGoldens("invalid_email", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byType(TextFormField).first, "bademail@gt.edu");
      await tester.pumpAndSettle();
      await expectLater(find.byType(LoginScreen),
          matchesGoldenFile('goldens/invalid_email.png'));
    });

    testGoldens("invalid_password", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).last, "badpass");
      await tester.pumpAndSettle();
      await expectLater(find.byType(LoginScreen),
          matchesGoldenFile('goldens/invalid_password.png'));
    });
  });
}
