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
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Peanuts",
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
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Fish",
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
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" None",
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
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Vegetarian",
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
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Vegan",
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
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Pescatarian",
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
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Halal",
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
              height: 5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(" Kosher",
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
      appBar: AppBar(title: const Text("Food Preferences")));
  }
}
