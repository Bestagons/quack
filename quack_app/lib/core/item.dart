// Implements a food item and data associated with that item
class Item {
  final String _name;
  final List _category;
  bool _isFavorite;
  final bool _isCurrentlyBeingServed;
  final String _serveTime;
  final String _station;

  // Implements a single food item
  //
  // required name - the name of the food item
  // required category - the category the food item falls under
  // required isFavorite - is the item favorited by the user
  Item(this._name, this._category, this._isFavorite,
      this._isCurrentlyBeingServed, this._serveTime, this._station);

  // Toggle the item as a favorite or not
  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    // TODO: write backend code to remember this decision and return status code
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
}
