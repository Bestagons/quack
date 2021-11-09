import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:quack_app/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group("Main", () {
    testGoldens("app", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(const MyApp());
      List<String> creds = await TestAuth().getAuthCredentials();
      await TestAuth().authenticateTest(tester, creds);
      await tester.pumpAndSettle();
      await expectLater(
          find.byType(MyApp), matchesGoldenFile('goldens/app.png'));
    });
  });
}
