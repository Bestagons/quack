import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/auth/auth.dart';

class TestAuth {
  static final TestAuth _auth = TestAuth._internal();

  factory TestAuth() {
    return _auth;
  }

  TestAuth._internal();

  Future<void> authenticateTest(WidgetTester tester) async {
    Auth().setTest();

    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextFormField).first, "test@emory.edu");
    await tester.enterText(find.byType(TextFormField).last, "fakepassword1!");
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 100),
      EnginePhase.sendSemanticsUpdate,
      const Duration(seconds: 3),
    );
  }
}
