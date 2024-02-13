import 'package:noti/data/data_sources/local_database/one_time_notifications_dao.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/one_time_notifications_repository.dart';

class OneTimeNotificationsRepositoryImpl
    implements OneTimeNotificationsRepository {
  OneTimeNotificationsRepositoryImpl({
    required this.oneTimeNotificationsDao,
  });

  final OneTimeNotificationsDao oneTimeNotificationsDao;

  @override
  Future<void> addNotification(OneTimeNotification notification) async {
    oneTimeNotificationsDao.addNotification(
        OneTimeNotificationEntity.fromOneTimeNotification(notification));
  }

  @override
  List<OneTimeNotification> getAllNotifications() {
    return oneTimeNotificationsDao.getAllNotifications();
  }

  @override
  void removeNotification(int id) {
    oneTimeNotificationsDao.removeNotification(id);
  }

  @override
  OneTimeNotification? getSavedNotification(int id) {
    return oneTimeNotificationsDao.getSavedNotification(id);
  }
}
