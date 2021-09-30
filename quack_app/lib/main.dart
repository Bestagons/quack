import 'package:flutter/material.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/screens/homepage/home_screen.dart';

void main() {
  MenuData data = MenuData();
  runApp(MyApp(menuData: data));
}

class MyApp extends StatelessWidget {
  final MenuData menuData;
  const MyApp({Key? key, required this.menuData}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeScreen(title: 'Quack', menuData: menuData),
    );
  }
}
