import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/core/notification_data.dart';

class NotificationScreen extends StatefulWidget {
  final String title;

  const NotificationScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationData notificationData;

  @override
  void initState() {
    // Re-cache updated values on view
    super.initState();
    notificationData = NotificationData();
    notificationData.getExistingNotifications();
    loadData();
  }

  void loadData() async {
    await notificationData.getExistingNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, //
      children: <Widget>[
        Expanded(
          child: Container(
              child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(children: listNotifications()),
          )),
        ),
      ],
    );
  }

  List<Widget> listNotifications() {
    AutoSizeGroup _group = AutoSizeGroup();
    return List<Widget>.generate(notificationData.currentNotifications.length,
        (index) {
      return Card(
          clipBehavior: Clip.antiAlias,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              // white space
              height: 20,
              width: double.infinity,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                          notificationData.currentNotifications[index].title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          group: _group,
                          maxFontSize: 24,
                          maxLines: 1),
                      AutoSizeText(
                          notificationData
                              .currentNotifications[index].description,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          group: _group,
                          maxFontSize: 24,
                          maxLines: 2),
                    ])),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    primary: Colors.red,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      notificationData.remove(notificationData.currentNotifications[index].id);
                    });
                  },
                  child: const Text('Delete'),
                )),
            const SizedBox(
              // white space
              height: 5,
              width: double.infinity,
            ),
          ]));
    });
  }
}
