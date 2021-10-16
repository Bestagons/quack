import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/item.dart';
import 'package:quack_app/core/menu_data.dart';
import 'package:quack_app/components/food_summary.dart';

// StationList returns a list of Items with a couple of configurations
// byServeTime: creates main headers that organizes each item by the time they are served
// filter: allows custom filters to by passed in
// suffix: any widget that is appended at the end of the list
class StationList extends StatefulWidget {
  final bool byServeTime;
  final Function(Item item) filter;
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: Constants.kBackgroundGrey,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
                children: getStationList(
              context,
            )),
          )),
    );
  }

  // getStationList - generates the list of items dynamically based on the passed in
  // widget parameters
  List<Widget> getStationList(BuildContext context) {
    AutoSizeGroup _group = AutoSizeGroup();
    MenuData menuData = MenuData();
    List<Widget> list = List.empty(growable: true);
    int repeat = widget.byServeTime ? MenuData().getServeTimes().length : 1;
    List<String> serveTimes = MenuData().getServeTimes();

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
        Function(Item item) mainFilter = widget.byServeTime
            ? (Item item) => // Filter that checks serve time & station
                item.getStation().compareTo(station) == 0 &&
                item.getServeTime().compareTo(serveTimes[i]) == 0
            // Filter that only checks for station
            : (Item item) => item.getStation().compareTo(station) == 0;

        List<Item> stationCurrentItems = menuData
            .menuFilteredBy((item) => mainFilter(item) && widget.filter(item));

        // Station subheader
        list.add(Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: AutoSizeText(station.toUpperCase(),
                style: const TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold))));

        // All food items
        for (Item item in stationCurrentItems) {
          list.add(FoodSummary(item: item, group: _group));
        }
      }
    }

    // Add the suffix
    if (widget.suffix != null) {
      list.add(widget.suffix!);
    }

    return list;
  }
}
