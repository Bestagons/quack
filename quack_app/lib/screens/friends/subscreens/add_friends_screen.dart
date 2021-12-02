import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddFriendsScreenState();
}

class AddFriendsScreenState extends State<AddFriendsScreen> {
  static const historyLength = 5;

  final _searchHistory = {
    'bruce.lee@emory.edu': 'Bruce Lee',
    'captain.marvel@emory.edu': 'Captain Marvel',
    'wanda.vision@emory.edu': 'Wanda Vision'
  };

  String selectedTerm = "";
  String currentEmail = "";
  String currentName = "";
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FloatingSearchBar(
          hint: "Search for friends with email...",
          openAxisAlignment: 0.0,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
          elevation: 4.0,
          onQueryChanged: (query) {
            selectedTerm = query;
            searchFriendResult();
          },
          onSubmitted: (query) {
            selectedTerm = query;
            searchFriendResult();
          },
          transitionCurve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 500),
          transition: CircularFloatingSearchBarTransition(),
          debounceDelay: const Duration(milliseconds: 500),
          actions: [
            FloatingSearchBarAction(
                showIfOpened: true,
                child: CircularButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    searchFriendResult();
                    setState(() {});
                  },
                )),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (BuildContext context, Animation<double> transition) {
            return ClipRRect(
                child: Material(
                    color: Colors.white,
                    child: Container(
                      height: 200.0,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Icon(status
                                ? Icons.person_add
                                : Icons.person_remove),
                            title: Text(currentName),
                            subtitle: Text(currentEmail),
                            onTap: () {
                              setState(() {
                                status = !status;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  )
                );
          },
        ),
        appBar: AppBar(title: const Text("Add Friends")));
  }

  void searchFriendResult() {
    _searchHistory.forEach((key, value) {
      if (selectedTerm == key) {
        currentEmail = key;
        currentName = value;
      }
    });
  }
}
