import 'package:quack_app/core/item.dart';

// MenuData implements logic for menu related data
class MenuData {
  late String currentlyServing;
  late List<Item> menu;

  MenuData() {
    getCurrentlyServing();
    getTodaysMenu();
  }

  // getCurrentlyServing returns what time-of-day meal is being served
  // (Breakfast, Lunch, Dinner, etc)
  String getCurrentlyServing() {
    // TODO: Implement DCT Backend
    currentlyServing = "Dinner";
    return currentlyServing;
  }

  // getTodaysMenu returns a list of Items generated from today's menu
  List<Item> getTodaysMenu() {
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
    return menu;
  }
}
