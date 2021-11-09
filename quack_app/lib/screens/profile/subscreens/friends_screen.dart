import 'package:flutter/material.dart';
import 'package:quack_app/core/user/user.dart';

class FriendsScreen extends StatefulWidget {
  final bool isSharing = false;
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FriendsScreenState();
  }
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Friends"),
                )),
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon((User().userData.isSharingLoc())
                        ? Icons.location_on
                        : Icons.location_off),
                    iconSize: 30,
                    color: (User().userData.isSharingLoc())
                        ? Colors.blue
                        : Colors.blue[700],
                    onPressed: () {
                      setState(() {
                        User().userData.toggleShareLoc();
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
