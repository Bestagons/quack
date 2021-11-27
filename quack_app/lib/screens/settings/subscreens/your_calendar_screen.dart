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
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("This page is coming soon...",
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
      appBar: AppBar(title: const Text("Your Calendar")));
  }
}
