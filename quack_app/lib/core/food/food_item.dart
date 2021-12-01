// Implements a food item and data associated with that item
import 'dart:math';

import 'package:quack_app/core/user/user.dart';

class FoodItem {
  final String _name;
  final List _category;
  bool _isFavorite;
  final bool _isCurrentlyBeingServed;
  final String _serveTime;
  final String _station;
  final int _general_rating;
  int _user_rating;
  // Implements a single food item
  //
  // required name - the name of the food item
  // required category - the category the food item falls under
  // required isFavorite - is the item favorited by the user
  FoodItem(
      this._name,
      this._category,
      this._isFavorite,
      this._isCurrentlyBeingServed,
      this._serveTime,
      this._station,
      this._general_rating,
      this._user_rating);

  // Toggle the item as a favorite or not
  Future<void> toggleFavorite() async {
    bool ok = await User().userData.toggleFavorite(getName(), !_isFavorite);
    if (ok) {
      // If backend updated, show UI update
      _isFavorite = !_isFavorite;
    }
  }

  String getName() {
    return _name;
  }

  List getCategory() {
    return _category;
  }

  bool isFavorite() {
    return _isFavorite;
  }

  bool isCurrentlyBeingServed() {
    return _isCurrentlyBeingServed;
  }

  String getServeTime() {
    return _serveTime;
  }

  String getStation() {
    return _station;
  }

  int getRating() {
    return _general_rating;
  }

  int getUserRating() {
    return _user_rating;
  }

  void setUserRating(int rating) {
    // TODO: Update app backend with new rating
    _user_rating = rating;
  }
}
