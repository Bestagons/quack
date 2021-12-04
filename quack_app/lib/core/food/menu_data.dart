import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:quack_app/core/food/food_item.dart';

// MenuData implements logic for menu related data as a Singleton
class MenuData {
  String _currentServeTime = "";
  List<FoodItem> _allMenu = [];
  List<FoodItem> _currentMenu = List.empty();
  List<String> _stations = List.empty();
  List<String> _serveTimes = List.empty();
  Map<String, dynamic> _data = {};
  static const String baseUrl = "dct-api.herokuapp.com"; // "dct-api.herokuapp.com";
  static final MenuData _menuData = MenuData._internal();
  bool isTest = false;
  Map<String, Map<String, Object>> testData = {
    "stations": {
      "Stem To Root": {
        "name": "Stem To Root",
        "menu": [
          {
            "name": "Pancakes",
            "station": "Stem To Root",
            "meal_time": "Breakfast",
            "calories": "100",
            "categories": ["carbs"]
          },
          {
            "name": "Wings",
            "station": "Stem To Root",
            "meal_time": "Lunch",
            "calories": "102",
            "categories": ["category1"]
          },
          {
            "name": "Macaroni & Cheese",
            "station": "Stem To Root",
            "meal_time": "Dinner",
            "calories": "102",
            "categories": ["vegan", "carbs"]
          },
          {
            "name": "Pasta",
            "station": "Stem To Root",
            "meal_time": "Breakfast",
            "calories": "100",
            "categories": ["carbs"]
          }
        ],
        "line_speed": 0
      },
      "605 Kitchen": {
        "name": "605 Kitchen",
        "menu": [
          {
            "name": "Bagel",
            "station": "605 Kitchen",
            "meal_time": "Lunch",
            "calories": "100",
            "categories": ["carbs"]
          },
          {
            "name": "Grilled Chicken",
            "station": "605 Kitchen",
            "meal_time": "Dinner",
            "calories": "102",
            "categories": ["vegan", "carbs"]
          },
          {
            "name": "Veggie Fried Rice",
            "station": "605 Kitchen",
            "meal_time": "Breakfast",
            "calories": "100",
            "categories": ["carbs"]
          },
          {
            "name": "French Fries",
            "station": "605 Kitchen",
            "meal_time": "Lunch",
            "calories": "100",
            "categories": ["carbs"]
          }
        ],
        "line_speed": 0
      },
      "Spice": {
        "name": "Spice",
        "menu": [
          {
            "name": "Cereal",
            "station": "Spice",
            "meal_time": "Dinner",
            "calories": "102",
            "categories": ["vegan", "carbs"]
          },
          {
            "name": "Beyond Beef Burger",
            "station": "Spice",
            "meal_time": "Breakfast",
            "calories": "100",
            "categories": ["carbs"]
          },
          {
            "name": "Avacado Grilled Cheese",
            "station": "Spice",
            "meal_time": "Lunch",
            "calories": "100",
            "categories": ["carbs"]
          },
          {
            "name": "Ceasar Salad",
            "station": "Spice",
            "meal_time": "Dinner",
            "calories": "102",
            "categories": ["vegan", "carbs"]
          }
        ],
        "line_speed": 0
      },
      "Luncheonnette": {
        "name": "Luncheonnette",
        "menu": [
          {
            "name": "Sandwhich",
            "station": "Luncheonnette",
            "meal_time": "Breakfast",
            "calories": "102",
            "categories": ["category1"]
          },
          {
            "name": "Portobello Mushrooms",
            "station": "Luncheonnette",
            "meal_time": "Lunch",
            "calories": "102",
            "categories": ["vegan", "carbs"]
          },
          {
            "name": "Mediterranean Pita",
            "station": "Luncheonnette",
            "meal_time": "Dinner",
            "calories": "100",
            "categories": ["carbs"]
          }
        ],
        "line_speed": 0
      }
    },
    "serve_times": {
      "Breakfast": "7am - 10am",
      "Lunch": "11am - 2pm",
      "Dinner": "2pm - 5pm"
    }
  };

  factory MenuData() {
    return _menuData;
  }

  MenuData._internal();

  // loadTodaysMenu loads the menu for the entire day
  Future loadTodaysMenu() async {
    _allMenu.clear();
    var stations = _data['stations'];
    _currentServeTime = _data["current_serve_time"] ?? "Dinner";
    for (var s in stations.keys) {
      List menu = stations[s]['menu'];
      for (var item in menu) {
        _allMenu.add(FoodItem(
            item['name'],
            [],
            false, // TODO: Implement checking user database for if item is favorited
            item['meal_time'].compareTo(getServeTime()) == 0,
            item['meal_time'],
            item['station'],
            5, // TODO: Implement general rating dct backend
            3)); // TODO: Implement user rating app backend
      }
    }

    _serveTimes = _data['serve_times'].keys.toList();

    _stations = _data['stations'].keys.toList();
  }

  // loadCurrentMenu loads the current menu
  void loadCurrentMenu() {
    // TODO: Implement DCT Backend
    _currentMenu =
        _allMenu.where((item) => item.isCurrentlyBeingServed()).toList();
  }

  // loadData loads all data that needs to be fetched from the server at once
  Future loadData() async {
    if (isTest == false) {
      final url = Uri.http(baseUrl, "/dct-data");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        _data = await convert.jsonDecode(response.body) as Map<String, dynamic>;
        await loadTodaysMenu().then((_) {
          loadCurrentMenu();
        });
        print("DCT Data received");
      } else {
        print("DCT Data not received");
      }
    } else {
      _data = testData;
      await loadTodaysMenu().then((_) {
        loadCurrentMenu();
      });
    }
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
