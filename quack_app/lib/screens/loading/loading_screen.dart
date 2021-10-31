import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final Future<String> Function() waitOn;
  final String routeTo;

  const LoadingScreen({Key? key, required this.waitOn, required this.routeTo})
      : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  void runWaitOn() async {
    await widget.waitOn();
    Navigator.pushReplacementNamed(context, widget.routeTo, arguments: {});
  }

  @override
  void initState() {
    super.initState();
    runWaitOn();
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
