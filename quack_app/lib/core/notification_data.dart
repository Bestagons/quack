import 'package:flutter/cupertino.dart';

class NotificationObject {
  String title;
  String description;
  DateTime postDate;
  UniqueKey id = UniqueKey();

  NotificationObject(this.title, this.description, this.postDate);
}

// Notification implements logic for menu related data
class NotificationData {
  late List<NotificationObject> currentNotifications;
  static final NotificationData _notificationData = NotificationData._internal();

  factory NotificationData() {
    return _notificationData;
  }

  NotificationData._internal();

  // Fetches existing notifications from disk, and remove outdated notifications
  Future<List<NotificationObject>> getExistingNotifications() {
    currentNotifications = testData();
    return Future.value(currentNotifications);
  }

  List<NotificationObject> remove(UniqueKey id) {
    currentNotifications.removeWhere((element) => element.id == id);
    return currentNotifications;
  }

  List<NotificationObject> testData() {
    List<NotificationObject> testData = [
      NotificationObject("Favorite Food",
          "Your favorite dish Grilled Chicken will be served at dinner tomorrow",
          DateTime.now()),
      NotificationObject("Favorite Food",
          "Your favorite dish Beyond Beef Burger will be served at breakfast",
          DateTime.now()),
      NotificationObject("Lunch Time",
          "Get Lunch at 3:20 PM today after chem 150",
          DateTime.now()),
    ];
    return testData;
  }
}
