import 'package:flutter/material.dart';

class NotificationsPreferencesScreen extends StatefulWidget {
  const NotificationsPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NotificationsPreferencesScreenState();
  }
}

class _NotificationsPreferencesScreenState
    extends State<NotificationsPreferencesScreen> {
      bool mealIsChecked = false;
      bool timeIsChecked = false;
      bool friendIsChecked = false;
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('This page is coming soon, but here is a preview...', 
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    )
                  ],
                )
              ),
              const SizedBox(
                height: 20.0,
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey.shade400
              ),
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.zero),
                //   color: Colors.amber
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: mealIsChecked,
                              onChanged: (bool? value)  {
                                setState(() {
                                  mealIsChecked = value!;
                                });
                              }     
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Meal Favorites', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Get notified when your favorite meal is being served', 
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                )
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey.shade400
              ),
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.zero),
                //   color: Colors.amber
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: timeIsChecked,
                              onChanged: (bool? value)  {
                                setState(() {
                                  timeIsChecked = value!;
                                });
                              }     
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Meal Times', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Get notified when breakfast, lunch, or dinner starts and ends', 
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey.shade400
              ),
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.zero),
                //   color: Colors.amber
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: friendIsChecked,
                              onChanged: (bool? value)  {
                                setState(() {
                                  friendIsChecked = value!;
                                });
                              }     
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Friend Location', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Get notified when your friend is sharing their seating location', 
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.left
                            )
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ]
                      )
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey.shade400
              ),
            ],
          ),
        ),
      ),
        appBar: AppBar(title: const Text("Notifications Preferences")));
  }
}
