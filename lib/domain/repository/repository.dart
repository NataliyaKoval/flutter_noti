import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/models/recurring_notification.dart';

abstract class Repository {
  void addOneTimeNotification(OneTimeNotification notification);

  List<OneTimeNotification> getOneTimeNotifications();

  void removeOneTimeNotification(int id);

  void addRecurringNotification(RecurringNotification notification);

  List<RecurringNotification> getRecurringNotifications(int interval);

  void removeRecurringNotification(int id);
}
