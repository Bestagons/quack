import 'package:quack_app/core/item.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// MenuData implements logic for menu related data as a Singleton
class MenuData {
  String _currentServeTime = "";
  final List<Item> _allMenu = [];
  List<Item> _currentMenu = List.empty();
  List<String> _stations = List.empty();
  List<String> _serveTimes = List.empty();
  Map<String, dynamic> _data = {};
  static const String baseUrl = "127.0.0.1:8000";
  static final MenuData _menuData = MenuData._internal();

  factory MenuData() {
    return _menuData;
  }

  MenuData._internal();

  Future getDCTData() async {
    print("entered");
    final url = Uri.http(baseUrl, "/dct-data");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      _data =
          await convert.jsonDecode(response.body) as Map<String, dynamic>;

      print("DCT Data received");
      // print(_data['stations']);
      return Future.value(true);
    } else {
        print("DCT Data not received");
      return Future.value(false);
    }
  }

  // loadCurrentlyServing loads the current serve time
  Future loadCurrentServeTime() async {
    // TODO: Implement DCT Backend
    _currentServeTime = "Dinner";
  }

  // loadTodaysMenu loads the menu for the entire day
  Future loadTodaysMenu() async {
    print(_data);
    var stations = _data['stations'];
    for (var s in stations.keys) {
      List menu = stations[s]['menu'];
      for(var item in menu){
              _allMenu.add(Item(
                item['name'],
                item['categories'], 
                false, // TODO: Implement checking user database for if item is favorited 
                item['meal_time'].compareTo(getServeTime()) == 0, 
                item['meal_time'], 
                item['station']));
      }
    }
    print(_allMenu);

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
    await getDCTData();
    await loadCurrentServeTime();
    await loadTodaysMenu().then((_) {
      loadCurrentMenu();
    });
  }

  // getCurrentMenu returns the menu currently being served
  List<Item> getCurrentMenu() {
    return _currentMenu;
  }

  // getAllMenu returns the menu with all items for the entire day
  List<Item> getAllMenu() {
    return _allMenu;
  }

  // getServeTime returns what time-of-day meal is being served
  // (Breakfast, Lunch, Dinner, etc)
  String getServeTime() {
    return _currentServeTime;
  }

  // menuFilteredBy returns a list of items filtered by the passed in filter
  List<Item> menuFilteredBy(Function(Item item) filter) {
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
