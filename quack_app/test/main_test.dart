import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  MenuData data = MenuData();
  group("Main", () {
    testGoldens("app", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(MyApp(menuData: data));
      await expectLater(
          find.byType(MyApp), matchesGoldenFile('goldens/app.png'));
    });
  });
}
