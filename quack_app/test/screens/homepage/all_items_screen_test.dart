import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/food/food_item.dart';
import 'package:quack_app/core/food/menu_data.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/homepage/all_items_screen.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  MenuData().isTest = true;
  final scrollable = find.byWidgetPredicate((widget) => widget is Scrollable && widget.physics is ClampingScrollPhysics);
  group("All Items Screen", () {
    testGoldens("basic_view", (WidgetTester tester) async {
      await loadAppFonts();
      MyApp app = const MyApp();

      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester);
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Mediterranean Pita'), 10.0, scrollable: scrollable);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byType(ListTile).last);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await expectLater(find.byType(MyApp),
          matchesGoldenFile('goldens/all_items_basic_view.png'));
    });

    // testGoldens("like_food", (WidgetTester tester) async {
    //   await loadAppFonts();
    //   MyApp app = const MyApp();
    //   await tester.pumpWidget(app);
    //   await TestAuth().authenticateTest(tester);
    //   await tester.pumpAndSettle();
    //   await tester.scrollUntilVisible(
    //     find.text('Mediterranean Pita'), 10.0, scrollable: scrollable);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.tap(find.byType(ListTile).last);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.tap(find.byIcon(Constants.kFavorite).first);
    //   await tester.pumpAndSettle(const Duration(seconds: 2));
    //   await expectLater(find.byType(AllItemsScreen),
    //       matchesGoldenFile('goldens/all_items_like_food.png'));
    //   int totalFavorited = 0;
    //   for (FoodItem item in MenuData().getAllMenu()) {
    //     totalFavorited += item.isFavorite() ? 1 : 0;
    //   }
    //   expect(totalFavorited, 1);
    // });
    //
    // testGoldens("like_three_food", (WidgetTester tester) async {
    //   await loadAppFonts();
    //   MyApp app = const MyApp();
    //   await tester.pumpWidget(app);
    //   await TestAuth().authenticateTest(tester);
    //   await tester.pumpAndSettle();
    //   await tester.scrollUntilVisible(
    //     find.text('Mediterranean Pita'), 10.0, scrollable: scrollable);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.tap(find.byType(ListTile).last);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.tap(find.byIcon(Constants.kFavorite).first);
    //   await tester.pump();
    //   await tester.tap(find.byIcon(Constants.kFavorite).first);
    //   await tester.pump();
    //   await tester.tap(find.byIcon(Constants.kFavorite).first);
    //   await tester.pump();
    //   await expectLater(find.byType(AllItemsScreen),
    //       matchesGoldenFile('goldens/all_items_like_three_food.png'));
    //   int totalFavorited = 0;
    //   for (FoodItem item in MenuData().getAllMenu()) {
    //     totalFavorited += item.isFavorite() ? 1 : 0;
    //   }
    //   expect(totalFavorited, 3);
    // });

    testGoldens("scroll", (WidgetTester tester) async {
      await loadAppFonts();
      MyApp app = const MyApp();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester);
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Mediterranean Pita').first, 10.0, scrollable: scrollable);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.tap(find.byType(ListTile).last);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.scrollUntilVisible(
        find.text('Ceasar Salad'), 10.0, scrollable: scrollable);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await expectLater(find.byType(AllItemsScreen),
          matchesGoldenFile('goldens/all_items_scroll.png'));
    });
    // testGoldens("like_last_and_scroll", (WidgetTester tester) async {
    //   await loadAppFonts();
    //   MyApp app = const MyApp();
    //   await tester.pumpWidget(app);
    //   await TestAuth().authenticateTest(tester);
    //   await tester.pumpAndSettle();
    //   await tester.scrollUntilVisible(
    //     find.text('Mediterranean Pita').first, 10.0, scrollable: scrollable);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.tap(find.byType(ListTile).last);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.scrollUntilVisible(
    //     find.text('Mediterranean Pita'), 10.0, scrollable: scrollable);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await tester.tap(find.byIcon(Constants.kFavorite).last);
    //   await tester.pumpAndSettle(const Duration(seconds: 3));
    //   await expectLater(find.byType(AllItemsScreen),
    //       matchesGoldenFile('goldens/all_items_like_last_and_scroll.png'));
    //   int totalFavorited = 0;
    //   for (FoodItem item in MenuData().getAllMenu()) {
    //     totalFavorited += item.isFavorite() ? 1 : 0;
    //   }
    //   expect(totalFavorited, 1);
    // });

    testGoldens("verify_like_persistance", (WidgetTester tester) async {
      await loadAppFonts();
      MyApp app = const MyApp();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester);
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
         find.text('Mediterranean Pita').first, 10.0, scrollable: scrollable);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await expectLater(find.byType(HomeScreen).last,
          matchesGoldenFile('goldens/all_items_verify_like_persistance.png'));
    });
  });
}
