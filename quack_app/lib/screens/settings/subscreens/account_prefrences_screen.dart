import 'package:flutter/material.dart';

class AccountPrefrencesScreen extends StatefulWidget {
  const AccountPrefrencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountPrefrencesScreenState();
  }
}

class _AccountPrefrencesScreenState extends State<AccountPrefrencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Account Prefrences")));
  }
}
