import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:quack_app/constants/constants.dart';

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
      // resizeToAvoidBottomInset: false,
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
                    Container(
                      child: Text('Our Mission', 
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
                            child: Text('Bestagons are a 6-person team dedicated to developing the experience and skills necessary for a common project to build up their resumes. Centered around their shared experience as Emory students, they hope to add value to some of the lives of their community through their work.', 
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
                    Container(
                      child: Text('Our Vision', 
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
                            child: Text('The Quack Project on every Emory student phone, organizing the calendars of users & eliminating all frustrations with on-campus dining.', 
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
                    Container(
                      child: Text('Why Quack App?', 
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
                            child: Text('Quack is an app that increases the quality of life of Emory students both by finding free time in your calendar to suggest events/activities to integrate into your schedule (i.e. when to study, eat, etc.) and by adding value to the experience of getting food at DCT (food locations, capacity, etc.).', 
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
                    Container(
                      child: Text('The Bestagons Team', 
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
                    Row(
                      children: <Widget>[
                        const SizedBox(
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
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text('Miles Robertson',
                            style: const TextStyle(
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
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text('Rafael Piloto',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                            )
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                      ]
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
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
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text('Ore Adenikinju',
                            style: const TextStyle(
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
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text('David Wei',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                            )
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                      ]
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(
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
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text('Mimi Olayeye',
                            style: const TextStyle(
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
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                        child: Align(alignment: Alignment.centerLeft,
                          child: Text('Brenda Cano',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                            )
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                      ]
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(title: const Text("About Quack App"))
    );
  }
}
