import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/item.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';

void main() {
  group("Home Screen Test", () {
    MenuData fakeMenuData = MenuData();
    fakeMenuData.loadData();

    MyApp app = const MyApp();
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
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await expectLater(
          find.byType(HomeScreen), matchesGoldenFile('goldens/like_food.png'));
      int totalFavorited = 0;
      for (Item item in fakeMenuData.getCurrentMenu()) {
        totalFavorited += item.isFavorite() ? 1 : 0;
      }
      expect(totalFavorited, 1);
    });

    testGoldens("like_three_food", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kFavorite).first);
      await tester.pump();
      await tester.tap(find.byIcon(Constants.kFavorite).first);
      await tester.pump();
      await tester.tap(find.byIcon(Constants.kFavorite).first);
      await tester.pump();
      await expectLater(find.byType(HomeScreen),
          matchesGoldenFile('goldens/like_three_food.png'));
      int totalFavorited = 0;
      for (Item item in fakeMenuData.getCurrentMenu()) {
        totalFavorited += item.isFavorite() ? 1 : 0;
      }
      // Liked 3 in the previous test
      expect(totalFavorited, 4);
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
      int totalFavorited = 0;
      for (Item item in fakeMenuData.getCurrentMenu()) {
        totalFavorited += item.isFavorite() ? 1 : 0;
      }
      // Liked 4 in the previous test
      expect(totalFavorited, 5);
    });
  });
}
