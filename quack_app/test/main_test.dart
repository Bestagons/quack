import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  var homepageUITest = 'homepage_ui_test';
  group(homepageUITest, () {
    testGoldens(homepageUITest, (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(const MyApp());
      await expectLater(
          find.byType(MyApp), matchesGoldenFile('goldens/$homepageUITest.png'));
    });
  });
}
