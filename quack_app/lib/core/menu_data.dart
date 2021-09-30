import 'package:quack_app/core/item.dart';

// MenuData implements logic for menu related data
class MenuData {
  late String currentlyServing;
  late List<Item> menu;

  MenuData() {
    currentlyServing = getCurrentlyServing();
    menu = getTodaysMenu();
  }

  // getCurrentlyServing returns what time-of-day meal is being served
  // (Breakfast, Lunch, Dinner, etc)
  String getCurrentlyServing() {
    return "Dinner";
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

    return List.generate(foods.length,
        (index) => Item(name: foods[index], category: "", isFavorite: false));
  }
}
