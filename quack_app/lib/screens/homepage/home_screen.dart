import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quack_app/core/menu_data.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final MenuData menuData;
  const HomeScreen({Key? key, required this.title, required this.menuData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //
          title: Text(widget.title) //
          ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start, //
        children: <Widget>[
          //
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 75,
            width: 300,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 199, 4),
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
                  child: Text("Currently Serving: ${widget.menuData.currentlyServing}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(children: getTodaysUserMenu()),
        ],
      )),
    );
  }

  List<Widget> getTodaysUserMenu() {
    var foods = [
      "Grilled Chicken",
      "Beyond Beef Burger",
      "Portobello Mushrooms",
      "Macaroni & Cheese",
      "Veggie Fried Rice",
      "Avocado Grilled Cheese",
      "Mediterranean Pita"
    ];
    return List<Widget>.generate(foods.length, (index) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 40),
          child: Text(foods[index],
              style: const TextStyle(color: Colors.black, fontSize: 32)),
        ),
        Expanded(
          child: Text(" ." * 100,
              style: const TextStyle(color: Colors.black, fontSize: 32),
              maxLines: 1),
        ),
        const Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.star_border, size: 35))),
      ]);
    });
  }
}
