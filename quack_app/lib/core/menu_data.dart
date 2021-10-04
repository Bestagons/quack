import 'package:quack_app/core/item.dart';

// MenuData implements logic for menu related data
class MenuData {
  String currentlyServing = "";
  List<Item> menu = List.empty();
  static final MenuData _menuData = MenuData._internal();

  factory MenuData() {
    return _menuData;
  }

  MenuData._internal();

  // getCurrentlyServing returns what time-of-day meal is being served
  // (Breakfast, Lunch, Dinner, etc)
  Future<String> getCurrentlyServing() {
    // TODO: Implement DCT Backend
    currentlyServing = "Dinner";
    return Future.value(currentlyServing);
  }

  // getTodaysMenu returns a list of Items generated from today's menu
  Future<List<Item>> getTodaysMenu() {
    var foods = [
      "Grilled Chicken",
      "Beyond Beef Burger",
      "Portobello Mushrooms",
      "Macaroni & Cheese",
      "Veggie Fried Rice",
      "Avocado Grilled Cheese",
      "Mediterranean Pita",
      "Pasta",
      "French Fries",
      "Ceasar Salad"
    ];

    // TODO: Implement DCT Backend
    menu = List.generate(foods.length,
        (index) => Item(name: foods[index], category: "", isFavorite: false));
    return Future.value(menu);
  }
}
