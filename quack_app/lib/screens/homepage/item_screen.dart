import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/core/food/food_item.dart';

class ItemScreen extends StatelessWidget {
  final FoodItem item;

  const ItemScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          item.getName(),
          overflow: TextOverflow.ellipsis,
        )),
        body: Center(
            child: AutoSizeText(
          item.getName(),
          style: const TextStyle(fontSize: 38),
          maxLines: 1,
        )));
  }
}
