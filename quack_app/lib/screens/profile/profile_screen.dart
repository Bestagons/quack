import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/screens/profile/subscreens/calendar_screen.dart';
import 'package:quack_app/screens/profile/subscreens/email_screen.dart';
import 'package:quack_app/screens/profile/subscreens/friends_screen.dart';

// Profile screen implements the screen for the profile page
class ProfileScreen extends StatefulWidget {
  final String title;
  const ProfileScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextStyle _style = const TextStyle(color: Colors.black, fontSize: 24);
  final AutoSizeGroup _group = AutoSizeGroup();
  @override
  void initState() {
    // Re-cache updated values on view
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                color: Constants.kBackgroundGrey,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(children: <Widget>[
                    _getTile(context, "Friends", Icons.group_add_outlined,
                        const FriendsScreen()),
                    _getTile(
                        context, //
                        "Calendar", //
                        Icons.calendar_today_outlined, //
                        const CalendarScreen()), //
                    _getTile(context, "Email", Icons.alternate_email,
                        const EmailScreen())
                  ]),
                )),
          )
        ],
      ),
    );
  }

  // Get the Tile for each page
  // title - the text for the tile
  // icon - the icon to display before the title
  // screen - the Screen to route to after tap
  Widget _getTile(BuildContext context, String title, IconData icon,
      StatefulWidget screen) {
    return ListTile(
        onTap: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => screen))
            },
        title: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Container(
                decoration:
                    const BoxDecoration(border: Border(bottom: BorderSide())),
                child: AutoSizeText(
                  title,
                  style: _style,
                  group: _group,
                ))
          ],
        ));
  }
}
