import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddFriendsScreenState();
}

class AddFriendsScreenState extends State<AddFriendsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: search friend by email with search bar
        body: FloatingSearchBar(
          hint: "Search for friends with email...",
          openAxisAlignment: 0.0,
          scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
          elevation: 4.0,
          onQueryChanged: (query) {},
          transitionCurve: Curves.easeInOut,
          transitionDuration: Duration(milliseconds: 500),
          transition: CircularFloatingSearchBarTransition(),
          debounceDelay: Duration(milliseconds: 500),
          actions: [
            FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: Icon(Icons.person_add),
                  onPressed: () {
                    print('Friends Pressed');
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
                      color: Colors.white,
                      child: Column(
                        children: const [
                          ListTile(
                            title: Text('Friend Name'),
                            subtitle: Text('Friend Information'),
                          )
                        ],
                      )
                  )
               ),
            );
          },
        ),
        // TODO: display search results under search bar
        // TODO: click on result and it shows as a card under search bar
        // TODO: card has a "add friend" button, switches to "remove friend"
        appBar: AppBar(title: const Text("Add Friends")));
  }
}
