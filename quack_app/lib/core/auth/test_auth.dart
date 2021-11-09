import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quack_app/core/auth/auth.dart';

class TestAuth {
  static final TestAuth _auth = TestAuth._internal();

  factory TestAuth() {
    return _auth;
  }

  TestAuth._internal();

  Future<List<String>> getAuthCredentials() async {
    await dotenv.load(fileName: "test.env");
    String email = dotenv.get('TEST_EMAIL', fallback: "");
    String password = dotenv.get('TEST_PASSWORD', fallback: "");
    return [email, password];
  }

  Future<void> authenticateTest(WidgetTester tester, List<String> creds) async {
    String email = creds[0];
    String password = creds[1];

    expect(email == "", false);
    expect(password == "", false);
    await tester.pumpAndSettle();
    const MethodChannel channel =
        MethodChannel('plugins.flutter.io/path_provider');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return ".";
    });
    await Auth().saveAuth(email, password);

    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).first, email);
    await tester.enterText(find.byType(TextFormField).last, password);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 100),
      EnginePhase.sendSemanticsUpdate,
      const Duration(seconds: 3),
    );
  }
}
