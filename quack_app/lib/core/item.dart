// Implements a food item and data associated with that item
class Item {
  final String name;
  final String category;
  bool isFavorite;

  // Implements a single food item
  //
  // required name - the name of the food item
  // required category - the category the food item falls under
  // required isFavorite - is the item favorited by the user
  Item({required this.name, required this.category, required this.isFavorite});

  // Toggle the item as a favorite or not
  void toggleFavorite() {
    isFavorite = !isFavorite;
    // backend code to remember this decision
  }
}
