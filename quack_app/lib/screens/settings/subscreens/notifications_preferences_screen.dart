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
        appBar: AppBar(title: const Text("Notifications Preferences")));
  }
}
