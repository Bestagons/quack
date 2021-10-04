import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';
import 'package:quack_app/screens/homepage/item_screen.dart';

void main() {
  group("Item Screen Test", () {
    MenuData fakeMenuData = MenuData();
    fakeMenuData.getCurrentlyServing();
    fakeMenuData.getTodaysMenu();

    MyApp app = const MyApp();
    testGoldens("item_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      await expectLater(find.byType(ItemScreen),
          matchesGoldenFile('goldens/item_screen_view.png'));
    });

    testGoldens("back_click", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      await tester.tap(find.byTooltip("Back"));
      await tester.pumpWidget(app);
      await expectLater(find.byType(HomeScreen),
          matchesGoldenFile('goldens/item_screen_view_back.png'));
    });
  });
}
