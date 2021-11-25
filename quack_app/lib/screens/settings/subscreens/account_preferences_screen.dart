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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text("This is the account preferences screen",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),
                    )
                  ),
                )
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Account Preferences")));
  }
}
