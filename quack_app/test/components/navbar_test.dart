import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/components/navbar.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';

void main() {
  group("NavBar Test", () {
    const MaterialApp app = MaterialApp(home: NavBar());
    testGoldens("settings_active", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(NavBar),
          matchesGoldenFile('goldens/settings_active.png'));
    });

    testGoldens("notifications_active", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarNotificationsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(NavBar),
          matchesGoldenFile('goldens/notifications_active.png'));
    });

    testGoldens("dining_active", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(NavBar), matchesGoldenFile('goldens/dining_active.png'));
    });

    testGoldens("favorites_active", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarFavoritesIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(find.byType(NavBar),
          matchesGoldenFile('goldens/favorites_active.png'));
    });

    testGoldens("friends_active", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarProfileIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(NavBar), matchesGoldenFile('goldens/friends_active.png'));
    });
  });
}
