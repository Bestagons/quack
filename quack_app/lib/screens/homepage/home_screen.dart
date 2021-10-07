import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/components/station_list.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/screens/homepage/all_items_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MenuData menuData;
  @override
  void initState() {
    // Re-cache updated values on view
    super.initState();
    menuData = MenuData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start, //
      children: <Widget>[
        //
        const SizedBox(
          // white space
          height: 30,
        ),

        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Currently Serving: ${menuData.getServeTime()}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.filter_alt_outlined),
                      color: Colors.blueAccent,
                      iconSize: 32,
                      onPressed: () {},
                    )))
          ],
        ),
        SizedBox(
          height: 10,
          child: Container(color: Constants.kBackgroundGrey),
        ),
        StationList(
          byServeTime: false,
          filter: (item) => item.isCurrentlyBeingServed(),
          suffix: Row(children: [
            Expanded(
                child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AllItemsScreen(
                              title: "Today's Menu", menuData: menuData)));
                    }, //
                    title: const Text(
                      "... See all menus for the day",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )))
          ]),
        ),
      ],
    ));
  }
}
