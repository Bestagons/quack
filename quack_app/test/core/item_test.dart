import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/item.dart';

void main() {
  group("Item", () {
    test("Empty Item", () {
      Item item = Item("", [""], false, false, "", "");
      expect(item.getName(), "");
      expect(item.getCategory(), [""]);
      expect(item.isFavorite(), false);
      expect(item.isCurrentlyBeingServed(), false);
    });

    test("all", () {
      Item item = Item("Fries", ["Potato"], true, true, "Breakfast", "Station1");
      expect(item.getName(), "Fries");
      expect(item.getCategory(), ["Potato"]);
      expect(item.isFavorite(), true);
      expect(item.isCurrentlyBeingServed(), true);
      expect(item.getServeTime(), "Breakfast");
      expect(item.getStation(), "Station1");
    });

    test("toggle favorite", () {
      Item item = Item("Fries", ["Potato"], true, false, "Breakfast", "Empty");
      item.toggleFavorite();
      expect(item.isFavorite(), false);
    });
  });
}
