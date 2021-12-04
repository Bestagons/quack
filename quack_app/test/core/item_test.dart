import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/food/food_item.dart';
import 'package:quack_app/core/auth/test_auth.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group("Item", () {
    test("Empty Item", () {
      FoodItem item = FoodItem("", [""], false, false, "", "", 5, 5);
      expect(item.getName(), "");
      expect(item.getCategory(), [""]);
      expect(item.isFavorite(), false);
      expect(item.isCurrentlyBeingServed(), false);
    });

    test("all", () {
      FoodItem item = FoodItem(
          "Fries", ["Potato"], true, true, "Breakfast", "Station1", 5, 5);
      expect(item.getName(), "Fries");
      expect(item.getCategory(), ["Potato"]);
      expect(item.isFavorite(), true);
      expect(item.isCurrentlyBeingServed(), true);
      expect(item.getServeTime(), "Breakfast");
      expect(item.getStation(), "Station1");
    });

    // testGoldens("toggle favorite", (WidgetTester tester) async {
    //   await TestAuth().authenticateTest(tester);
    //   FoodItem item = FoodItem(
    //       "Fries", ["Potato"], true, false, "Breakfast", "Empty", 5, 5);
    //   await item.toggleFavorite();
    //   expect(item.isFavorite(), false);
    // });
  });
}
