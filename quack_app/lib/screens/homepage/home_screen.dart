import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/components/station_list.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/food/menu_data.dart';
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
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
            // white space
            color: Constants.kBackgroundGrey,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            height: 100,
            width: double.infinity,
          ),
          Positioned(
            left: 20.0,
            bottom: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Dobbs Common Table',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.ac_unit_sharp,
                      size: 15.0,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      'Currently Serving: ${menuData.getServeTime()}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]), //
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
