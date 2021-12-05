import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/food/food_item.dart';
import 'package:quack_app/core/food/menu_data.dart';
import 'package:quack_app/components/food_summary.dart';
import 'package:quack_app/core/user/user.dart';

// StationList returns a list of Items with a couple of configurations
// byServeTime: creates main headers that organizes each item by the time they are served
// filter: allows custom filters to by passed in
// suffix: any widget that is appended at the end of the list
class StationList extends StatefulWidget {
  final bool byServeTime;
  final Function(FoodItem item) filter;
  final Widget? suffix;

  const StationList(
      {Key? key, required this.byServeTime, required this.filter, this.suffix})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StationListState();
  }
}

class _StationListState extends State<StationList> {
  List<Widget> stationList = [];

  @override
  void initState() {
    super.initState();
    stationList = getStationList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: Constants.kBackgroundGrey,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(children: stationList),
          )),
    );
  }

  // getStationList - generates the list of items dynamically based on the passed in
  // widget parameters
  List<Widget> getStationList() {
    AutoSizeGroup _group = AutoSizeGroup();
    MenuData menuData = MenuData();
    List<Widget> list = List.empty(growable: true);
    int repeat = widget.byServeTime ? MenuData().getServeTimes().length : 1;
    List<String> serveTimes = MenuData().getServeTimes();
    List<String> favorites = User().userData.getFavorites();

    // repeats by total serve times or just once
    for (int i = 0; i < repeat; i++) {
      if (widget.byServeTime) {
        // Add the serve time header now
        list.add(Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: AutoSizeText(serveTimes[i].toUpperCase(),
                style: const TextStyle(
                    fontSize: 45, fontWeight: FontWeight.bold))));
      }
      // Go through all stations
      for (String station in menuData.getStations()) {
        // provide a main filter that checks for stations or serveTime & stations
        Function(FoodItem item) mainFilter = widget.byServeTime
            ? (FoodItem item) => // Filter that checks serve time & station
                item.getStation().compareTo(station) == 0 &&
                item.getServeTime().compareTo(serveTimes[i]) == 0
            // Filter that only checks for station
            : (FoodItem item) => item.getStation().compareTo(station) == 0;

        List<FoodItem> stationCurrentItems = menuData
            .menuFilteredBy((item) => mainFilter(item) && widget.filter(item));

        // Set all FoodItems that has name in favorites to be favorited
        // debugPrint(favorites.toString());
        for (FoodItem item in stationCurrentItems) {
          // debugPrint(item.getName());
          item.setIsFavorite(favorites.contains(item.getName()));
        }

        if (stationCurrentItems.isEmpty) {
          // If the station does not contain anything, don't add header.
          continue;
        }

        // Adds each station and their food items
        list.add(Stack(children: <Widget>[
          //Food items
          Container(
              margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
              height: 60.0 * stationCurrentItems.length + 40.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 40.0, 5.0, 20.0),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: stationCurrentItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodSummary(
                              item: stationCurrentItems[index],
                              group: _group,
                              onFavoritePressed: () {
                                stationList = getStationList();
                                setState(() {});
                              });
                        }),
                  ),
                ]),
              )),
          // Station sub header
          Container(
              margin: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              padding: const EdgeInsets.only(left: 10.0),
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Constants.kPrimaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(children: <Widget>[
                Text(station.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
              ]))
        ]));
      }
    }

    // Add the suffix
    if (widget.suffix != null) {
      list.add(widget.suffix!);
    }

    return list;
  }
}
