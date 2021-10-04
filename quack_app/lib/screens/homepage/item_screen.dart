import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  final String name;

  const ItemScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("")), // TODO: What should go here?
        body: Center(
            child: AutoSizeText(
          name,
          style: const TextStyle(fontSize: 38),
          maxLines: 1,
        )));
  }
}
