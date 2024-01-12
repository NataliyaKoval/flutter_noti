import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/data/entity/recurring_notification_entity.dart';

class LocalDatabase {
  final Box<OneTimeNotificationEntity> oneTimeNotifications =
      Hive.box<OneTimeNotificationEntity>('OneTimeNotifications');
  final Box<RecurringNotificationEntity> recurringNotifications =
      Hive.box<RecurringNotificationEntity>('OneMinuteNotifications');

  void addOneTimeNotification(OneTimeNotificationEntity notification) {
    oneTimeNotifications.put(notification.id, notification);
  }

  List<OneTimeNotificationEntity> getOneTimeNotifications() {
    return oneTimeNotifications.values.toList();
  }

  void removeOneTimeNotification(int key) {
    oneTimeNotifications.delete(key);
  }

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

  void removeOneMinuteNotification(int key) {
    recurringNotifications.delete(key);
  }
}
