import 'package:noti/domain/models/one_time_notification.dart';

abstract class OneTimeNotificationsRepository {
  void addNotification(OneTimeNotification notification);

  List<OneTimeNotification> getAllNotifications();

  void removeNotification(int id);

  OneTimeNotification? getSavedNotification(int id);
}
