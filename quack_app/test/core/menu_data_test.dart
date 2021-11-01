import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/item.dart';
import 'package:quack_app/core/menu_data.dart';

void main() {
  group("MenuData", () {
    MenuData menuData = MenuData();

    test("empty", () {
      expect(menuData.getAllMenu(), List.empty());
      expect(menuData.getCurrentMenu(), List.empty());
      expect(menuData.getServeTime(), "");
      expect(menuData.getServeTimes(), List.empty());
      expect(menuData.getStations(), List.empty());
    });

    test("initialize", () async {
      await menuData.loadData();

      expect(menuData.getAllMenu().isNotEmpty, true);
      expect(menuData.getCurrentMenu().isNotEmpty, true);
      expect(menuData.getServeTime().isNotEmpty, true);
      expect(menuData.getServeTimes().isNotEmpty, true);
      expect(menuData.getStations().isNotEmpty, true);
    });

    test("GetCurrentlyServing()", () async {
      String currentServing = menuData.getServeTime();
      expect(currentServing, "Dinner");
    });

    test("getTodaysMenu()", () async {
      List<Item> menu = menuData.getAllMenu();
      expect(menu.isNotEmpty, true);
    });

    test("getCurrentMenu", () {
      List<Item> currentItems = menuData.getCurrentMenu();
      expect(currentItems.isNotEmpty, true);
      for (Item item in currentItems) {
        expect(item.isCurrentlyBeingServed(), true);
        expect(item.getServeTime(), menuData.getServeTime());
      }
    });
  });
}
