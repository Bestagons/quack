import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/components/station_list.dart';
import 'package:quack_app/core/food/menu_data.dart';

void main() {
  group("StationList", () {
    MenuData fakeMenuData = MenuData();
    fakeMenuData.loadData();
    group("byServeTime", () {
      MaterialApp app = MaterialApp(
          home: Scaffold(
              body: Column(children: [
        StationList(byServeTime: true, filter: (item) => true)
      ])));

      testGoldens("basic_view", (WidgetTester tester) async {
        await loadAppFonts();
        await tester.pumpWidget(app);
        await expectLater(find.byType(StationList),
            matchesGoldenFile("goldens/station_list_byservetime.png"));
      });
    });

    group("all", () {
      MaterialApp app = MaterialApp(
          home: Scaffold(
              body: Column(children: [
        StationList(byServeTime: false, filter: (item) => true)
      ])));
      testGoldens("basic_view", (WidgetTester tester) async {
        await loadAppFonts();
        await tester.pumpWidget(app);
        await expectLater(find.byType(StationList),
            matchesGoldenFile("goldens/station_list_all.png"));
      });
    });

    group("current", () {
      MaterialApp app = MaterialApp(
          home: Scaffold(
              body: Column(children: [
        StationList(
            byServeTime: false, filter: (item) => item.isCurrentlyBeingServed())
      ])));
      testGoldens("basic_view", (WidgetTester tester) async {
        await loadAppFonts();
        await tester.pumpWidget(app);
        await expectLater(find.byType(StationList),
            matchesGoldenFile("goldens/station_list_current.png"));
      });
    });
  });
}
