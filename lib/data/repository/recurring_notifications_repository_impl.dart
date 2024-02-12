import 'package:noti/data/data_sources/local_database/recurring_notifications_dao.dart';
import 'package:noti/data/entity/recurring_notification_entity.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/recurring_notifications_repository.dart';

class RecurringNotificationsRepositoryImpl implements RecurringNotificationsRepository {
  RecurringNotificationsRepositoryImpl({
    required this.recurringNotificationsDao,
  });

  final RecurringNotificationsDao recurringNotificationsDao;

  @override
  void removeNotification(int id) {

    recurringNotificationsDao.removeRecurringNotification(id);

  }

  @override
  void addNotification(RecurringNotification notification) {
    recurringNotificationsDao.addRecurringNotification(
        RecurringNotificationEntity.fromRecurringNotification(notification));
  }

  @override
  List<RecurringNotification> getAllNotifications(int interval) {
    if (interval == 1) {
      return recurringNotificationsDao.getOneMinuteNotifications();
    } else if (interval == 3) {
      return recurringNotificationsDao.getThreeMinuteNotifications();
    } else if (interval == 5) {
      return recurringNotificationsDao.getFiveMinuteNotifications();
    } else {
      throw Exception();
    }
  }

  @override
  RecurringNotification? getSavedNotification(int id) {
    return recurringNotificationsDao.getSavedRecurringNotification(id);
  }
}
