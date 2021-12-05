import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:quack_app/screens/loading/loading_screen.dart';
import 'package:quack_app/screens/login/login_screen.dart';
import 'package:quack_app/screens/register/register_screen.dart';

import 'components/navbar.dart';

void main() async {
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quack App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(
              routeTo: "/login",
              waitOn: () {
                return Future.value(""); //  Don't load anything on app boot up
              },
            ),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MyHomePage(title: 'Quack'),
      },
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
