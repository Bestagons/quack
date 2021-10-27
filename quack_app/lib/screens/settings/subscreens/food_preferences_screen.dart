import 'package:flutter/material.dart';

class FoodPreferencesScreen extends StatefulWidget {
  const FoodPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodPreferencesScreenState();
  }
}

class _FoodPreferencesScreenState extends State<FoodPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Food Preferences")));
  }
}
