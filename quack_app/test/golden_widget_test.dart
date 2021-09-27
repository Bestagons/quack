import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  var test1Name = 'Homepage';
  testGoldens(test1Name, (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1170, 2532);
    tester.binding.window.devicePixelRatioTestValue = 3.0;
    await loadAppFonts();
    await tester.pumpWidget(const MyApp());
    await expectLater(find.byType(MyApp),
        matchesGoldenFile('goldens/$test1Name.png'));
  });
}
