import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/components/navbar.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/menu_data.dart';

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

  void loadData() async {
    await menuData.getCurrentlyServing();
    await menuData.getTodaysMenu();
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
        Container(
          height: 75,
          width: 300,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  color: Constants.kPrimaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.black)),
              child: const Center(
                  child: Text(
                "Today's Menus",
                style: TextStyle(color: Colors.black, fontSize: 36),
                textAlign: TextAlign.center,
              ))),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Currently Serving: ${menuData.currentlyServing}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
          child: Container(color: Constants.kBackgroundGrey),
        ),
        Expanded(
          child: Container(
              color: Constants.kBackgroundGrey,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(children: listUserMenu()),
              )),
        ),
      ],
    ));
  }

  List<Widget> listUserMenu() {
    AutoSizeGroup _group = AutoSizeGroup();
    return List<Widget>.generate(menuData.menu.length, (index) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 40),
            child: SizedBox(
                width: 300,
                height:
                    30, // DO NOT CHANGE THIS - CAUSES JITTER IN AUTOSIZETEXT
                child: AutoSizeText(menuData.menu[index].name,
                    style: const TextStyle(color: Colors.black, fontSize: 36),
                    group: _group,
                    maxFontSize: 36,
                    maxLines: 1))),
        Expanded(
          child: Text("" * 100),
        ),
        Align(
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                    icon: menuData.menu[index].isFavorite
                        ? const Icon(Constants.kFavorited,
                            color: Constants.kFavoritedColor)
                        : const Icon(Constants.kFavorite),
                    iconSize: 32,
                    onPressed: () {
                      setState(() {
                        menuData.menu[index].toggleFavorite();
                      });
                    }))),
      ]);
    });
  }
}
