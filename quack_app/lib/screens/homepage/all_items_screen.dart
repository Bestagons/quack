import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/components/station_list.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/menu_data.dart';

class AllItemsScreen extends StatefulWidget {
  final String title;
  final MenuData menuData;
  const AllItemsScreen({Key? key, required this.title, required this.menuData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Today's Menu",
          overflow: TextOverflow.ellipsis,
        )),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //
          children: <Widget>[
            SizedBox(
              // whitespace
              height: 10,
              child: Container(color: Constants.kBackgroundGrey),
            ),
            StationList(byServeTime: true, filter: (item) => true),
            SizedBox(
              height: 20,
              child: Container(color: Constants.kBackgroundGrey),
            ),
          ],
        )));
  }
}
