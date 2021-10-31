import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/core/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/loading/loading_screen.dart';

void main() {
  group("Loading Screen Test", () {
    MyApp app = const MyApp();

    testGoldens("loading_screen_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);

      await expectLater(find.byType(LoadingScreen),
          matchesGoldenFile('goldens/loading_screen_view.png'));
    });
  });
}
