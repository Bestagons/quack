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
              height: 30,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("This is the food preferences screen",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
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
