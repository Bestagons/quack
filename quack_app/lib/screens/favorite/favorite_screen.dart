import 'package:flutter/material.dart';
import 'package:quack_app/components/station_list.dart';

class FavoriteScreen extends StatefulWidget {
  final String title;

  const FavoriteScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // Re-cache updated values on view
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //
          children: <Widget>[
            //
            const SizedBox(
              // white space
              height: 30,
            ),
            StationList(
              byServeTime: false,
              filter: (item) => item.isFavorite(),
              suffix: null
            ),
          ],
        ));
  }
}
