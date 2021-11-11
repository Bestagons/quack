import 'package:quack_app/core/seating/seating_locations.dart';

class UserData {
  String _email = "";
  String _password = "";
  String _name = "";

  SeatingLocation _currentLoc = SeatingLocation.none_;
  bool _isSharingLoc = false;

  List<UserData> _friends = List.empty();

  // Constructor for app user
  UserData(String email, String password) {
    _email = email;
    _password = password;
    // Use email and password to authenticate and get user data
    _friends = [
      UserData.friend(
          "felipe@emory.edu", "Felipe", SeatingLocation.section_1, true),
      UserData.friend(
          "rafael@emory.edu", "Rafael", SeatingLocation.section_2, true),
      UserData.friend(
          "brenda@emory.edu", "Brenda Cano", SeatingLocation.section_5, true),
      UserData.friend(
          "david@emory.edu", "David", SeatingLocation.section_9, true),
      UserData.friend("ore@emory.edu", "Ore", SeatingLocation.section_4, true),
      UserData.friend(
          "mimi@emory.edu", "Mimi", SeatingLocation.section_8, true),
      UserData.friend("miles@emory.edu", "Miles Robertson",
          SeatingLocation.section_3, true),
      UserData.friend("rdj@emory.edu", "Robert Downey Jr.",
          SeatingLocation.section_6, true),
      UserData.friend(
          "superman@emory.edu", "Superman", SeatingLocation.none_, true),
      UserData.friend(
          "batman@emory.edu", "Batman", SeatingLocation.section_1, false),
      UserData.friend(
          "elchapo@emory.edu", "El Chapo", SeatingLocation.section_4, true),
    ];
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

  String getSeatingLocString() {
    return _currentLoc.toShortString();
  }

  String getEmail() {
    return _email;
  }

  String getName() {
    return _name;
  }
}
