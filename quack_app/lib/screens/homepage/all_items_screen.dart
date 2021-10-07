import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quack_app/components/station_list.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/menu_data.dart';

class AllItemsScreen extends StatefulWidget {
  final String title;
  final MenuData menuData;
  const AllItemsScreen({Key? key, required this.title, required this.menuData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Today's Menu",
          overflow: TextOverflow.ellipsis,
        )),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //
          children: <Widget>[
            SizedBox(
              // whitespace
              height: 10,
              child: Container(color: Constants.kBackgroundGrey),
            ),
            StationList(byServeTime: true, filter: (item) => true),
            SizedBox(
              height: 20,
              child: Container(color: Constants.kBackgroundGrey),
            ),
          ],
        )));
  }

  // List<Widget> listAllItems(BuildContext context) {
  //   AutoSizeGroup _group = AutoSizeGroup();
  //   List<Widget> list = List.empty(growable: true);
  //   for (String serveTime in widget.menuData.serveTimes) {
  //     list.add(AutoSizeText(serveTime.toUpperCase(),
  //         style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold)));
  //     List<Item> currentItems = widget.menuData.menuFilteredBy(
  //         (item) => item.getServeTime().compareTo(serveTime) == 0);

  //     for (String station in widget.menuData.stations) {
  //       List<Item> stationItems = currentItems
  //           .where((item) => item.getStation().compareTo(station) == 0)
  //           .toList();

  //       list.add(Text(station.toUpperCase(),
  //           style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)));

  //       for (Item item in stationItems) {
  //         list.add(Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //           Expanded(
  //               child: ListTile(
  //             onTap: () {
  //               Navigator.push(context, MaterialPageRoute(builder: (context) {
  //                 return ItemScreen(item: item);
  //               }));
  //             },
  //             title: AutoSizeText(item.getName(),
  //                 style: const TextStyle(color: Colors.black, fontSize: 25),
  //                 group: _group,
  //                 maxFontSize: 25,
  //                 maxLines: 1),
  //             trailing: IconButton(
  //                 icon: item.isFavorite()
  //                     ? const Icon(Constants.kFavorited,
  //                         color: Constants.kFavoritedColor)
  //                     : const Icon(Constants.kFavorite),
  //                 iconSize: 30,
  //                 splashRadius: 0.01,
  //                 onPressed: () {
  //                   setState(() {
  //                     item.toggleFavorite();
  //                   });
  //                 }),
  //           )),
  //         ]));
  //       }
  //     }
  //   }
  //   return list;
  // }
}
