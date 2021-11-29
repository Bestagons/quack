import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/food/food_item.dart';
import 'package:quack_app/core/food/menu_data.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/favorite/favorite_screen.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  List<String> creds = await TestAuth().getAuthCredentials();
  MenuData().isTest = true;
  final scrollable = find.byWidgetPredicate((widget) => widget is Scrollable && widget.physics is ClampingScrollPhysics);
  group("Favorite Screen", () {
    testGoldens("empty_favorites", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(find.byIcon(Constants.kNavBarFavoritesIcon));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await expectLater(
          find.byType(MyApp), matchesGoldenFile('goldens/empty_favorites.png'));
    });

    testGoldens("like_pita", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Mediterranean Pita'), 10.0, scrollable: scrollable);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Constants.kFavorite).last);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(find.byIcon(Constants.kNavBarFavoritesIcon));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await expectLater(find.byType(FavoriteScreen),
          matchesGoldenFile('goldens/favorite_like_pita.png'));
      int totalFavorited = 0;
      for (FoodItem item in MenuData().getAllMenu()) {
        totalFavorited += item.isFavorite() ? 1 : 0;
      }
      expect(totalFavorited, 1);
      expect(find.text("Mediterranean Pita"), findsOneWidget);
    });

    testGoldens("remove_like", (WidgetTester tester) async {
      MyApp app = const MyApp();
      await loadAppFonts();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Constants.kNavBarFavoritesIcon));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Constants.kFavorited).first);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      int totalFavorited = 0;
      for (FoodItem item in MenuData().getAllMenu()) {
        totalFavorited += item.isFavorite() ? 1 : 0;
      }
      expect(find.text("Mediterranean Pita"), findsNothing);
      expect(totalFavorited, 0);
    });
  });
}
