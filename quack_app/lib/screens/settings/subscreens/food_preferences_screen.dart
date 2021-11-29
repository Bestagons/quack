import 'package:flutter/material.dart';

class FoodPreferencesScreen extends StatefulWidget {
  const FoodPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FoodPreferencesScreenState();
  }
}

class _FoodPreferencesScreenState extends State<FoodPreferencesScreen> {
  bool vegetarian = false;
  bool vegan = false;
  bool pescatarian = false;
  bool halal = false;
  bool kosher = false;
  bool none = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Row(children: <Widget>[
                      const SizedBox(
                    width: 8.0,
                      ),
                      Flexible(
                      child: Text(
                          'This page is coming soon, but here is a preview...',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left)),
                      const SizedBox(
                    width: 8.0,
                      ),
                    ])
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Divider(thickness: 0.5, color: Colors.grey.shade400),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(children: const <Widget>[
                      SizedBox(
                    width: 8.0,
                      ),
                      Flexible(
                      child: Text('Allergies',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left)),
                      SizedBox(
                    width: 8.0,
                      ),
                    ]),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(children: <Widget>[
                      const SizedBox(
                    width: 8.0,
                      ),
                      Flexible(
                      child: Text(
                          'Here you will type in any allergies you may have.',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left)),
                      const SizedBox(
                    width: 8.0,
                      ),
                    ]),
                    const SizedBox(
                      height: 10.0,
                    ),
                      ],
                    ),
                    Divider(thickness: 0.5, color: Colors.grey.shade400),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(children: const <Widget>[
                          SizedBox(
                        width: 8.0,
                          ),
                          Flexible(
                          child: Text('Dietary Restrictions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                        width: 8.0,
                          ),
                          Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                              value: vegetarian,
                              onChanged: (bool? value) {
                                setState(() {
                                  vegetarian = value!;
                                });
                              })),
                          Flexible(
                          child: Text('Vegetarian',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          const SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                        width: 8.0,
                          ),
                          Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                              value: vegan,
                              onChanged: (bool? value) {
                                setState(() {
                                  vegan = value!;
                                });
                              })),
                          Flexible(
                          child: Text('Vegan',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          const SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                        width: 8.0,
                          ),
                          Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                              value: pescatarian,
                              onChanged: (bool? value) {
                                setState(() {
                                  pescatarian = value!;
                                });
                              })),
                          Flexible(
                          child: Text('Pescatarian',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          const SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                        width: 8.0,
                          ),
                          Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                              value: halal,
                              onChanged: (bool? value) {
                                setState(() {
                                  halal = value!;
                                });
                              })),
                          Flexible(
                          child: Text('Halal',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          const SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                        width: 8.0,
                          ),
                          Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                              value: kosher,
                              onChanged: (bool? value) {
                                setState(() {
                                  kosher = value!;
                                });
                              })),
                          Flexible(
                          child: Text('Kosher',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          const SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(children: <Widget>[
                          const SizedBox(
                        width: 8.0,
                          ),
                          Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                              value: none,
                              onChanged: (bool? value) {
                                setState(() {
                                  none = value!;
                                });
                              })),
                          const SizedBox(
                        width: 8.0,
                          ),
                          Flexible(
                          child: Text('None',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left)),
                          const SizedBox(
                        width: 8.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    Divider(thickness: 0.5, color: Colors.grey.shade400),
                  ],
                ),
              ),
            )
          ]
        ),
        appBar: AppBar(title: const Text("Food Preferences")));
  }
}
