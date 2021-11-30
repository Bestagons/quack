import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddFriendsScreenState();
}

class AddFriendsScreenState extends State<AddFriendsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Add Friends")));
  }
}

