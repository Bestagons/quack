import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/core/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';
import 'package:quack_app/screens/homepage/item_screen.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  List<String> creds = await TestAuth().getAuthCredentials();
  group("Item Screen Test", () {
    testGoldens("item_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      MyApp app = const MyApp();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(ItemScreen),
          matchesGoldenFile('goldens/item_screen_view.png'));
    });

    testGoldens("back_click", (WidgetTester tester) async {
      await loadAppFonts();
      MyApp app = const MyApp();
      await tester.pumpWidget(app);
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byTooltip("Back"));
      await tester.pumpWidget(app);
      await expectLater(find.byType(HomeScreen),
          matchesGoldenFile('goldens/item_screen_view_back.png'));
    });
  });
}
