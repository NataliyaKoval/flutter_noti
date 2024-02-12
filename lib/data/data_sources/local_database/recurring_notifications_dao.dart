import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/data/entity/recurring_notification_entity.dart';

class RecurringNotificationsDao {
  final Box<RecurringNotificationEntity> recurringNotifications =
  Hive.box<RecurringNotificationEntity>('RecurringNotifications');

  void addRecurringNotification(RecurringNotificationEntity notification) {
    recurringNotifications.put(notification.id, notification);
  }

  List<RecurringNotificationEntity> getOneMinuteNotifications() {
    return recurringNotifications.values
        .where((element) => element.interval == 1)
        .toList();
  }

  List<RecurringNotificationEntity> getThreeMinuteNotifications() {
    return recurringNotifications.values
        .where((element) => element.interval == 3)
        .toList();
  }

  List<RecurringNotificationEntity> getFiveMinuteNotifications() {
    return recurringNotifications.values
        .where((element) => element.interval == 5)
        .toList();
  }

  void removeRecurringNotification(int key) {
    recurringNotifications.delete(key);
  }

  RecurringNotificationEntity? getSavedRecurringNotification(int key) {
    return recurringNotifications.get(key);
  }
}
