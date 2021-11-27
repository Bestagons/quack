import 'package:flutter/material.dart';

class FoodPreferencesScreen extends StatefulWidget {
  const FoodPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodPreferencesScreenState();
  }
}

class _FoodPreferencesScreenState extends State<FoodPreferencesScreen> {
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
                    child: Text("This page is coming soon... \nbut here is a preview",
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
            Divider(
              thickness: 0.5,
              color: Colors.grey.shade400
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Allergies:",
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Peanuts",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Fish",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Etc",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey.shade400
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Dietary Restrictions:",
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("None",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Vegetarian",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Vegan",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Pescatarian",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Halal",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
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
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("Kosher",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey.shade400
            )
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Food Preferences")));
  }
}
