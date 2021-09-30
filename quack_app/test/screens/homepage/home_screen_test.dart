import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';

void main() {
  group("Home Screen Test", () {
    MenuData fakeMenuData = MenuData();
    MaterialApp app =
        MaterialApp(home: HomeScreen(title: "Quack", menuData: fakeMenuData));
    testGoldens("basic_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);

      await expectLater(
          find.byType(HomeScreen), matchesGoldenFile('goldens/basic_view.png'));
    });

    testGoldens("like_food", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kFavorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(HomeScreen), matchesGoldenFile('goldens/like_food.png'));
    });

    testGoldens("like_three_food", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kFavorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byIcon(Constants.kFavorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(HomeScreen),
          matchesGoldenFile('goldens/like_three_food.png'));
    });

    testGoldens("scroll", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.scrollUntilVisible(find.text("Ceasar Salad"), 10);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await expectLater(
          find.byType(HomeScreen), matchesGoldenFile('goldens/scroll.png'));
    });
    testGoldens("like_last_and_scroll", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.scrollUntilVisible(find.text("Ceasar Salad"), 10);
      await tester.tap(find.byIcon(Constants.kFavorite).last);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await expectLater(find.byType(HomeScreen),
          matchesGoldenFile('goldens/like_last_and_scroll.png'));
    });
  });
}