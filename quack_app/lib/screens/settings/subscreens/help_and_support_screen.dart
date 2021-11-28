import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HelpSupportScreenState();
  }
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
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
                      child: Text('FAQ', 
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                      )
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      child: Text('How do I add a food to my favorites list?', 
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center
                          )
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('When you are browsing the menu on the Dining tab, you can favorite a meal by clicking the heart icon next to the meal\'s name. All your favorited meals will be displayed on the Favorites tab.', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.center
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
                      child: Text('How do I share my location?', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center
                        )
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('Navigate to your Friends tab and click \"share location\" at the top. A map of the dining hall will appear. Simply click on one of the seating sections and your location will be updated.', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.center
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
                      child: Text('What sort of notifications will I receive?', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center
                        )
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text('To view your notifications navigate to the Notifications tab. The type of notifications you will receive are when your favorite meal is being served that day or when your friend is sharing their seating location.', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.center
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
              const SizedBox(
                height: 20.0,
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
                      child: Text('Contact Support', 
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
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
                            child: Text('If you still have any questions or concerns, please contact quack.dining.app@gmail.com and we will get back to you at our earliest convenience.', 
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                textAlign: TextAlign.center
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
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: const Text("Help and Support")));
  }
}
