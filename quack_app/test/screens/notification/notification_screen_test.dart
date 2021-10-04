import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:quack_app/constants/constants.dart';
import 'package:quack_app/core/notification_data.dart';
import 'package:quack_app/main.dart';
import 'package:quack_app/screens/notification/notification_screen.dart';

void main() {
  group("Notification Screen Test", () {
    NotificationData fakeNotificationData = NotificationData();
    fakeNotificationData.getExistingNotifications();

    MyApp app = const MyApp();
    testGoldens("basic_view", (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarNotificationsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await expectLater(
          find.byType(NotificationScreen),
          matchesGoldenFile('goldens/basic_view.png'));
    });

    testGoldens("delete_notification", (WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.tap(find.byIcon(Constants.kNavBarNotificationsIcon));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      var beforeCount = fakeNotificationData.currentNotifications.length;

      await tester.tap(find.text("Delete").first);
      await loadAppFonts();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await expectLater(
          find.byType(NotificationScreen), matchesGoldenFile('goldens/delete_notification_1.png'));
      int remainingCount = fakeNotificationData.currentNotifications.length;
      expect(beforeCount - remainingCount, 1);
    });
  });
}
