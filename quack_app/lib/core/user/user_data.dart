import 'dart:collection';

import 'package:quack_app/core/food/food_item.dart';
import 'package:quack_app/core/seating/seating_locations.dart';

class UserData {
  String _email = "";
  String _password = "";
  String _name = "";

  SeatingLocation _currentLoc = SeatingLocation.none_;
  bool _isSharingLoc = false;

  final List<UserData> _friends = List.empty();

  // Constructor for app user
  UserData(String email, String password) {
    _email = email;
    _password = password;
    // Use email and password to authenticate and get user data
  }

  // Constructor for empty user
  UserData.empty();

  // Friend constructor does not store any authentication
  // so data requests cannot be made on their behalf
  UserData.friend(String email, name, SeatingLocation loc, bool isSharingLoc) {
    _email = email;
    _name = name;
    _currentLoc = loc;
    _isSharingLoc = isSharingLoc;
  }

  Future<bool> initialize() async {
    _name = "Felipe";

    _currentLoc = SeatingLocation.section_1;
    _isSharingLoc = true;

    return Future.value(true);
  }

  Future<bool> toggleFavorite(String name) async {
    // TODO: Send backend update here
    return Future.value(true);
  }

  List<UserData> getFriends() {
    return _friends;
  }

  void toggleShareLoc() {
    // TODO: Remember this in database
    _isSharingLoc = !_isSharingLoc;
  }

  bool isSharingLoc() {
    return _isSharingLoc;
  }

  void setSeatingLoc(SeatingLocation loc) {
    _currentLoc = loc;
  }

  SeatingLocation getSeatingLoc() {
    return _currentLoc;
  }

  String getEmail() {
    return _email;
  }

  String getName() {
    return _name;
  }
}
