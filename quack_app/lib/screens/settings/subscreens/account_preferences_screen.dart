import 'package:flutter/material.dart';

class AccountPreferencesScreen extends StatefulWidget {
  const AccountPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountPreferencesScreenState();
  }
}

class _AccountPreferencesScreenState extends State<AccountPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Account Preferences")));
  }
}
