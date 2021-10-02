import 'package:flutter/material.dart';
import 'package:quack_app/core/menu_data.dart';

import 'components/navbar.dart';

void main() async {
  MenuData menuData = MenuData();
  await menuData.getCurrentlyServing();
  await menuData.getTodaysMenu();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Quack'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // The root view is a navigation controller.
    // All other views should be subview of this
    return const NavBar();
  }
}
