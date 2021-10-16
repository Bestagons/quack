import 'package:flutter/material.dart';

class NotificationsPrefrencesScreen extends StatefulWidget {
  const NotificationsPrefrencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationsPrefrencesScreenState();
  }
}

class _NotificationsPrefrencesScreenState
    extends State<NotificationsPrefrencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Notifications Prefrences")));
  }
}
