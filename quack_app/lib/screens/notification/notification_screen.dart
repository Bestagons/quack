import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/components/navbar.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/notification_data.dart';

class NotificationScreen extends StatefulWidget {
  final String title;
  final NotificationData notificationData = NotificationData();
  NotificationScreen(Key? key, this.title):
    super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // Re-cache updated values on view
    super.initState();
    loadData();
  }

  void loadData() async {
    await widget.notificationData.getExistingNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title) //
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, //
              children: <Widget>[
                Expanded(
                  child: Container(
                      color: Constants.kBackgroundGrey,
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Column(children: listNotifications()),
                      )),
                ),
              ],
            )),
        bottomNavigationBar: const NavBar());
  }

  List<Widget> listNotifications() {
    AutoSizeGroup _group = AutoSizeGroup();
    return List<Widget>.
    generate(widget.notificationData.currentNotifications.length, (index) {
      return
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AutoSizeText(widget.notificationData.currentNotifications[index].title,
          style: const TextStyle(color: Colors.black, fontSize: 24),
          group: _group,
          maxFontSize: 24,
          maxLines: 1),
        AutoSizeText(widget.notificationData.currentNotifications[index].description,
            style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            group: _group,
            maxFontSize: 24,
            maxLines: 2),
      ]);
    });
  }
}
