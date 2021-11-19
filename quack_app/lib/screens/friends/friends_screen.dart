import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/core/user/user.dart';
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
        ],
      ),
    );
  }
}
