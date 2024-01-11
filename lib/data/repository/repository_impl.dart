import 'package:noti/data/datasources/local_database.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/data/entity/recurring_notification_entity.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({
    required this.localDatabase,
  });

  final LocalDatabase localDatabase;

  @override
  Future<void> addOneTimeNotification(OneTimeNotification notification) async {
    localDatabase.addOneTimeNotification(
        OneTimeNotificationEntity.fromOneTimeNotification(notification));
  }

  @override
  List<OneTimeNotification> getOneTimeNotifications() {
    return localDatabase.getOneTimeNotifications();
  }

  @override
  void removeOneTimeNotification(int id) {
    localDatabase.removeOneTimeNotification(id);
  }

  @override
  void addOneMinuteNotification(RecurringNotification notification) {
    localDatabase.addOneMinuteNotification(
        RecurringNotificationEntity.fromRecurringNotification(notification));
  }

  @override
  List<RecurringNotification> getOneMinuteNotifications() {
    return localDatabase.getOneMinuteNotifications();
  }

  @override
  void removeOneMinuteNotification(int id) {
    localDatabase.removeOneMinuteNotification(id);
  }
}
