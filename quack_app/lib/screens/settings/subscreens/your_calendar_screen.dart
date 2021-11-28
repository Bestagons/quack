import 'package:flutter/material.dart';

class YourCalendarScreen extends StatefulWidget {
  const YourCalendarScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _YourCalendarScreenState();
  }
}

class _YourCalendarScreenState extends State<YourCalendarScreen> {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text("This page is coming soon...",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 25,
                      fontWeight: FontWeight.normal
                    ),
                    textAlign: TextAlign.center
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Your Calendar")));
  }
}
