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
    return Scaffold(appBar: AppBar(title: const Text("Your Calendar")));
  }
}
