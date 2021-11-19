import 'package:quack_app/core/food/food_item.dart';

// MenuData implements logic for menu related data as a Singleton
class MenuData {
  String _currentServeTime = "";
  List<FoodItem> _allMenu = List.empty();
  List<FoodItem> _currentMenu = List.empty();
  List<String> _stations = List.empty();
  List<String> _serveTimes = List.empty();

  static final MenuData _menuData = MenuData._internal();

  factory MenuData() {
    return _menuData;
  }

  MenuData._internal();

  // loadCurrentlyServing loads the current serve time
  Future loadCurrentServeTime() async {
    // TODO: Implement DCT Backend
    _currentServeTime = "Dinner";
  }

  // loadTodaysMenu loads the menu for the entire day
  Future loadTodaysMenu() async {
    var foods = [
      "Pancakes",
      "Bagel",
      "Cereal",
      "Sandwhich",
      "Wings",
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
    _serveTimes = [
      "Breakfast",
      "Lunch",
      "Dinner"
    ]; // Serve times will be parsed here from backend
    _stations = [
      "Stem To Root",
      "605 Kitchen",
      "Spice",
      "Luncheonnette"
    ]; // Stations will be parsed here from backend

    // TODO: Implement DCT Backend
    _allMenu = List.generate(foods.length, (index) {
      return FoodItem(
          foods[index],
          "",
          false,
          _serveTimes[index % _serveTimes.length].compareTo(getServeTime()) ==
              0,
          _serveTimes[index % _serveTimes.length],
          _stations[index % _stations.length]);
    });
  }

  // loadCurrentMenu loads the current menu
  void loadCurrentMenu() {
    // TODO: Implement DCT Backend
    _currentMenu =
        _allMenu.where((item) => item.isCurrentlyBeingServed()).toList();
  }

  // loadData loads all data that needs to be fetched from the server at once
  Future loadData() async {
    await loadCurrentServeTime();
    await loadTodaysMenu().then((_) {
      loadCurrentMenu();
    });
  }

  // getCurrentMenu returns the menu currently being served
  List<FoodItem> getCurrentMenu() {
    return _currentMenu;
  }

  // getAllMenu returns the menu with all items for the entire day
  List<FoodItem> getAllMenu() {
    return _allMenu;
  }

  // getServeTime returns what time-of-day meal is being served
  // (Breakfast, Lunch, Dinner, etc)
  String getServeTime() {
    return _currentServeTime;
  }

  // menuFilteredBy returns a list of items filtered by the passed in filter
  List<FoodItem> menuFilteredBy(Function(FoodItem item) filter) {
    return getAllMenu().where((item) => filter(item)).toList();
  }

  // getStations returns all of the stations serving
  List<String> getStations() {
    return _stations;
  }

  // getServeTimes returns all of the serve times
  List<String> getServeTimes() {
    return _serveTimes;
  }
}
