import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/item.dart';

void main() {
  group("Item", () {
    test("Empty Item", () {
      Item item = Item(name: "", category: "", isFavorite: false);
      expect(item.name, "");
      expect(item.category, "");
      expect(item.isFavorite, false);
    });

    test("Fries", () {
      Item item = Item(name: "Fries", category: "Potato", isFavorite: true);
      expect(item.name, "Fries");
      expect(item.category, "Potato");
      expect(item.isFavorite, true);
    });

    test("Toggle favorite", () {
      Item item = Item(name: "Fries", category: "Potato", isFavorite: true);
      item.toggleFavorite();
      expect(item.isFavorite, false);
    });
  });
}
