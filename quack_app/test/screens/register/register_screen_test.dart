import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/register/register_screen.dart';

void main() async {
  group("Register Screen Test", () {
    testGoldens("basic_view", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining("Sign Up"));
      await tester.pumpAndSettle();
      await expectLater(find.byType(RegisterScreen),
          matchesGoldenFile('goldens/basic_view.png'));
    });

    testGoldens("invalid_email", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byType(TextFormField).at(1), "bademail@gt.edu");
      await tester.pumpAndSettle();
      await expectLater(find.byType(RegisterScreen),
          matchesGoldenFile('goldens/invalid_email.png'));
    });

    testGoldens("invalid_password", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(2), "badpass");
      await tester.pumpAndSettle();
      await expectLater(find.byType(RegisterScreen),
          matchesGoldenFile('goldens/invalid_password.png'));
    });
    testGoldens("invalid_confirm", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).last, "badpass");
      await tester.pumpAndSettle();
      await expectLater(find.byType(RegisterScreen),
          matchesGoldenFile('goldens/invalid_confirm.png'));
    });

    testGoldens("valid_form", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(find.textContaining("Sign Up"));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byType(TextFormField).first, "test@emory.edu");
      await tester.enterText(find.byType(TextFormField).at(2), "test1234");
      await tester.enterText(find.byType(TextFormField).last, "test1234");
      await tester.pumpAndSettle();
      await expectLater(find.byType(RegisterScreen),
          matchesGoldenFile('goldens/valid_form.png'));
    });
  });
}
