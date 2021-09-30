import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/menu_data.dart';

void main() {
  group("MenuData", () {
    MenuData menuData = MenuData();
    test("GetCurrentlyServing()", () {
      expect(menuData.getCurrentlyServing(), "Dinner");
    });

    test("getTodaysMenu()", () {
      expect(menuData.getTodaysMenu().isNotEmpty, true);
    });
  });
}
