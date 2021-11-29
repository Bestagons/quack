import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/core/food/menu_data.dart';
import 'package:quack_app/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  MenuData().isTest = true;
  group("Main", () {
    testGoldens("app", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(const MyApp());
      await TestAuth().authenticateTest(tester);
      await tester.pumpAndSettle();
      await expectLater(
          find.byType(MyApp), matchesGoldenFile('goldens/app.png'));
    });
  });
}
