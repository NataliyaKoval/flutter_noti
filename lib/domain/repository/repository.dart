import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/models/recurring_notification.dart';

abstract class Repository {
  void addOneTimeNotification(OneTimeNotification notification);

  List<OneTimeNotification> getOneTimeNotifications();

  void removeNotification(int id, int? interval);

  void addRecurringNotification(RecurringNotification notification);

  List<RecurringNotification> getRecurringNotifications(int interval);

  OneTimeNotification? getSavedNotification(int id);
}
