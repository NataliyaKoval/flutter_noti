import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';

class LocalDatabase {
  final Box<OneTimeNotificationEntity> oneTimeNotifications =
      Hive.box<OneTimeNotificationEntity>('OneTimeNotifications');

  void addOneTimeNotification(OneTimeNotificationEntity notification) {
    oneTimeNotifications.put(notification.id, notification);
  }

  List<OneTimeNotificationEntity> getOneTimeNotifications() {
    return oneTimeNotifications.values.toList();
  }

  void removeOneTimeNotification(int key) {
    oneTimeNotifications.delete(key);
  }
}
