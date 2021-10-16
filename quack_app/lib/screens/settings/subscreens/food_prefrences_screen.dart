import 'package:flutter/material.dart';

class FoodPrefrencesScreen extends StatefulWidget {
  const FoodPrefrencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodPrefrencesScreenState();
  }
}

class _FoodPrefrencesScreenState extends State<FoodPrefrencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Food Prefrences")));
  }
}
