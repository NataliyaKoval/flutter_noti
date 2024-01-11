import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/data/entity/recurring_notification_entity.dart';

class LocalDatabase {
  final Box<OneTimeNotificationEntity> oneTimeNotifications =
      Hive.box<OneTimeNotificationEntity>('OneTimeNotifications');
  final Box<RecurringNotificationEntity> oneMinuteNotifications =
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

  void addOneMinuteNotification(RecurringNotificationEntity notification) {
    oneMinuteNotifications.put(notification.id, notification);
  }

  List<RecurringNotificationEntity> getOneMinuteNotifications() {
    return oneMinuteNotifications.values.toList();
  }

  void removeOneMinuteNotification(int key) {
    oneMinuteNotifications.delete(key);
  }
}
