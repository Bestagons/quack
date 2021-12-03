import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:quack_app/core/user/user.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddFriendsScreenState();
}

class AddFriendsScreenState extends State<AddFriendsScreen> {
  final _searchHistory = {
    'bruce.lee@emory.edu': 'Bruce Lee',
    'captain.marvel@emory.edu': 'Captain Marvel',
    'wanda.vision@emory.edu': 'Wanda Vision'
  };

  late String searchedEmail;
  String response = "";
  bool status = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FloatingSearchBar(
          hint: "Search for friends with email...",
          openAxisAlignment: 0.0,
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
          elevation: 4.0,
          onSubmitted: (query) async {
            searchedEmail = query;
            response = await User().userData.searchFriend(query);
          },
          transitionCurve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 500),
          transition: CircularFloatingSearchBarTransition(),
          debounceDelay: const Duration(milliseconds: 500),
          builder: (BuildContext context, Animation<double> transition) {
            if (response == "User with this email does not exist" || response == ""){
              return ClipRRect(
                child: Material(
                    color: Colors.white,
                    child: Container(
                      height: 200.0,
                      color: Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(response),
                          ),
                        ],
                      ),
                    )
                  )
                );
            } else {
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
                            title: Text(response),
                            subtitle: Text(searchedEmail),
                            onTap: () {
                              setState(() {
                                //status = !status;
                                User().userData.addFriend(searchedEmail);
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  )
                );
            }
          },
        ),
        appBar: AppBar(title: const Text("Add Friends")));
  }
}
