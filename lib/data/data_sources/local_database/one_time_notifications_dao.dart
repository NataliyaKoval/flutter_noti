import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';

class OneTimeNotificationsDao {
  final Box<OneTimeNotificationEntity> oneTimeNotifications =
  Hive.box<OneTimeNotificationEntity>('OneTimeNotifications');

  void addNotification(OneTimeNotificationEntity notification) {
    oneTimeNotifications.put(notification.id, notification);
  }

  List<OneTimeNotificationEntity> getAllNotifications() {
    return oneTimeNotifications.values.toList();
  }

  void removeNotification(int key) {
    oneTimeNotifications.delete(key);
  }

  OneTimeNotificationEntity? getSavedNotification(int key) {
    return oneTimeNotifications.get(key);
  }
}
