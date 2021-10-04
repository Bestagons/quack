import 'package:flutter_test/flutter_test.dart';
import 'package:quack_app/core/notification_data.dart';

void main() {
  group("NotificationData", () {
    NotificationData notificationData = NotificationData();
    test("getExistingNotifications()", () async {
      await notificationData.getExistingNotifications();
      expect(notificationData.currentNotifications.length, greaterThan(0));
    });

    test("remove()", () async {
      var beforeCount = notificationData.currentNotifications.length;
      NotificationObject first = notificationData.currentNotifications[0];
      expect(notificationData.currentNotifications.contains(first), true);
      notificationData.remove(first.id);
      var remainingCount = notificationData.currentNotifications.length;
      expect(beforeCount - remainingCount, 1);
      expect(notificationData.currentNotifications.contains(first), false);
    });
  });
}