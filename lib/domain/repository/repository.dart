import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/models/recurring_notification.dart';

abstract class Repository {
  void addOneTimeNotification(OneTimeNotification notification);

  List<OneTimeNotification> getOneTimeNotifications();

  void removeOneTimeNotification(int id);

  void addOneMinuteNotification(RecurringNotification notification);

  List<RecurringNotification> getOneMinuteNotifications();

  void removeOneMinuteNotification(int id);
}
