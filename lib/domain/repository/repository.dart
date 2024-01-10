import 'package:noti/domain/models/one_time_notification.dart';

abstract class Repository {
  void addOneTimeNotification(OneTimeNotification notification);

  List<OneTimeNotification> getOneTimeNotifications();

  void removeOneTimeNotification(int id);
}
