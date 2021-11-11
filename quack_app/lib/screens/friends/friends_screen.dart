import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/user/user.dart';
import 'package:quack_app/core/user/user_data.dart';
import 'package:quack_app/screens/friends/subscreens/set_location_screen.dart';

class FriendsScreen extends StatefulWidget {
  final bool isSharing = false;
  final String title;
  const FriendsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FriendsScreenState();
  }
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const SetLocationScreen();
                }));
                setState(() {});
              },
              child: AutoSizeText(
                  "Share Location (${User().userData.getSeatingLocString()})"),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: Container(
                  color: Constants.kBackgroundGrey,
                  child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Column(children: getFriendsList())))),
        ],
      ),
    );
  }

  List<Widget> getFriendsList() {
    List<Widget> friendList = [];
    for (UserData friend in User().userData.getFriends()) {
      friendList.add(
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: ListTile(
            title: AutoSizeText(friend.getName(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            subtitle: AutoSizeText(
                friend.isSharingLoc()
                    ? "Section: ${friend.getSeatingLocString()}"
                    : "Not sharing location",
                style: const TextStyle(color: Colors.black)),
            tileColor: Colors.white,
            trailing: AutoSizeText("${Random.secure().nextInt(58) + 1} min ago",
                style: const TextStyle(color: Colors.grey)),
          ),
        ),
      );
    }
    return friendList;
  }
}
