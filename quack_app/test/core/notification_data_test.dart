import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/notification_data.dart';

void main() {
  group("MenuData", () {
    NotificationData notificationData = NotificationData();
    test("getExistingNotifications()", () async {
      await notificationData.getExistingNotifications();
      expect(notificationData.currentNotifications.length, 3);
    });

    test("remove()", () async {
      NotificationObject first = notificationData.currentNotifications[0];
      notificationData.remove(first.id);
      expect(notificationData.currentNotifications.length, 2);
      expect(notificationData.currentNotifications.contains(first), false);
    });
  });
}