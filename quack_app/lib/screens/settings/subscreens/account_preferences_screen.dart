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
        child: Container(
          constraints: BoxConstraints.expand(),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/dct.png'),
          //     fit: BoxFit.cover),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.zero),
                //   color: Colors.amber
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text('Hello!', 
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                      )
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text('Thank you for using our app!', 
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center
                          )
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text('Delete Account', 
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                              ),
                              textAlign: TextAlign.center
                          )
                    ),
                  ],
                )
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: const Text("Account Preferences")));
  }
}
