import 'dart:convert';

import 'package:quack_app/core/auth/auth.dart';
import 'package:quack_app/core/seating/seating_locations.dart';

import 'package:http/http.dart' as http;

class UserData {
  String _email = "";
  String _password = "";
  String _token = "";
  String _name = "";

  SeatingLocation _currentLoc = SeatingLocation.none_0;
  bool _isSharingLoc = false;

  List<UserData> _friends = List.empty();

  // Constructor for app user
  UserData(String email, password, token) {
    _email = email;
    _password = password;
    _token = token;
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

  Future<bool> initialize(String user_data) async {
    final Map data = jsonDecode(user_data);
    _currentLoc = SeatingLocation.none_0.fromInt(data["loc"]);
    _isSharingLoc = data["is_sharing_location"];
    _friends = await loadFriends();

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

  String getSeatingLocString() {
    return _currentLoc.toShortString();
  }

  String getEmail() {
    return _email;
  }

  String getName() {
    return _name;
  }

  Future<List<UserData>> loadFriends() async {
    if (Auth().isTest()) {
      return [
        UserData.friend("", "Brenda", SeatingLocation.section_9, true),
        UserData.friend("", "Ore", SeatingLocation.section_4, true),
        UserData.friend("", "David", SeatingLocation.section_3, false)
      ];
    }

    final uri = Uri.http(Auth().getBaseURL(), "/friends/get-friends");
    final response =
        await http.post(uri, headers: {"Authorization": "Bearer " + _token});
    if (response.statusCode == 200) {
      final List<UserData> friends = [];

      final List r = jsonDecode(response.body);

      for (var f in r) {
        friends.add(UserData.friend(
            f["email"],
            f["name"],
            SeatingLocation.none_0.fromInt(f["loc"]),
            f["is_sharing_location"]));
      }
      return Future.value(friends);
    } else {
      print("[user_data.dart.loadFriends] " + response.body);
    }

    return Future.value([]);
  }
}
