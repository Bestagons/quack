import 'package:flutter/material.dart';

class NotificationsPreferencesScreen extends StatefulWidget {
  const NotificationsPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationsPreferencesScreenState();
  }
}

class _NotificationsPreferencesScreenState
    extends State<NotificationsPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("This page is coming soon...\nbut here is a preview",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Meal Favorites Notifications",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Get notified when your favorite meal is being served.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Meal Times Notifications",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Get notified when breakfast, lunch, or dinner starts and ends.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Friend Location Notifications",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Get notified when your friend is sharing their seating location.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            )
          ],
        ),
      ),
        appBar: AppBar(title: const Text("Notifications Preferences")));
  }
}
