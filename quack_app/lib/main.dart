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
