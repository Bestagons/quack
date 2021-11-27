import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HelpSupportScreenState();
  }
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
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
                    child: Text("FAQ",
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
                height: 5.0,
              ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("How do I add a food to my favorites list?",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("When you are browsing the menu on the Dining tab, you can favorite a meal by clicking the heart icon next to the meal's name. All your favorited meals will be displayed on the Favorites tab.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
                height: 2.0,
              ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("How do I share my location?",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Navigate to your Friends tab and click \"share location\" at the top. A map of the dining hall will appear. Simply click on one of the seating sections and your location will be updated.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
                height: 2.0,
              ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("What sort of notifications will I receive?",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("To view your notifications navigate to the Notifications tab. The type of notifications you will receive are when your favorite meal is being served that day or when your friend is sharing their seating location.",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
            const SizedBox(
                height: 20.0,
              ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Contact Support",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 5.0,
              ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("If you still have any questions or concerns, please contact quack.dining.app@gmail.com and we will get back to you at our earliest convenience.",
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
              width: 5,
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Help and Support")));
  }
}
