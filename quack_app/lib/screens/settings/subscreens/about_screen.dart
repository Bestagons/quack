import 'package:flutter/material.dart';
import 'dart:ui';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AboutScreenState();
  }
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text('Our Mission', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: Text('Bestagons are a 6-person team dedicated to developing the experience and skills necessary for a common project to build up their resumes. Centered around their shared experience as Emory students, they hope to add value to some of the lives of their community through their work.', 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal
                                  ),
                                  textAlign: TextAlign.center
                              )
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                          ]
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text('Our Vision', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: Text('The Quack Project on every Emory student phone, organizing the calendars of users & eliminating all frustrations with on-campus dining.', 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal
                                  ),
                                  textAlign: TextAlign.center
                              )
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                          ]
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text('Why Quack App?', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: Text('Quack is an app that increases the quality of life of Emory students both by finding free time in your calendar to suggest events/activities to integrate into your schedule (i.e. when to study, eat, etc.) and by adding value to the experience of getting food at DCT (food locations, capacity, etc.).', 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal
                                  ),
                                  textAlign: TextAlign.center
                              )
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                          ]
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Text('The Bestagons Team', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 8.0,
                            ),
                            CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/team/miles.png')
                                )
                              ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                            child: Align(alignment: Alignment.centerLeft,
                              child: Text('Miles Robertson',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                                )
                              ),
                            ),
                            CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/team/rafael.png')
                                )
                              ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                            child: Align(alignment: Alignment.centerLeft,
                              child: Text('Rafael Piloto',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                                )
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                          ]
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 8.0,
                            ),
                            CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/team/ore.png')
                                )
                              ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                            child: Align(alignment: Alignment.centerLeft,
                              child: Text('Ore Adenikinju',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                                )
                              ),
                            ),
                            CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/team/david.png')
                                )
                              ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                            child: Align(alignment: Alignment.centerLeft,
                              child: Text('David Wei',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                                )
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                          ]
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          children: const <Widget>[
                            SizedBox(
                              width: 8.0,
                            ),
                            CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/team/mimi.png')
                                )
                              ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                            child: Align(alignment: Alignment.centerLeft,
                              child: Text('Mimi Olayeye',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                                )
                              ),
                            ),
                            CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.amber,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/team/brenda.png')
                                )
                              ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                            child: Align(alignment: Alignment.centerLeft,
                              child: Text('Brenda Cano',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                                )
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                          ]
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]
      ),
      appBar: AppBar(title: const Text("About Quack App"))
    );
  }
}
