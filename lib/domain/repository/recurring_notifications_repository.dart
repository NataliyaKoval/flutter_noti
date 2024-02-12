import 'package:noti/domain/models/recurring_notification.dart';

abstract class RecurringNotificationsRepository {
  void addNotification(RecurringNotification notification);

  void removeNotification(int id);

  List<RecurringNotification> getAllNotifications(int interval);

  RecurringNotification? getSavedNotification(int id);
}
