import 'package:flutter/material.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();
}
 
class LoadingScreenState extends State<LoadingScreen> {

  void getMenuData() async {
    MenuData menuData = MenuData();
    await menuData.loadData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {

    });
  }

  @override
  void initState() {
    super.initState();
    getMenuData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFC702),
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}