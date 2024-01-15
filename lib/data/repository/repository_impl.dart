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
  void removeNotification(int id, int? interval) {
    if (interval != null) {
      localDatabase.removeRecurringNotification(id);
    } else {
      localDatabase.removeOneTimeNotification(id);
    }
  }

  @override
  void addRecurringNotification(RecurringNotification notification) {
    localDatabase.addRecurringNotification(
        RecurringNotificationEntity.fromRecurringNotification(notification));
  }

  @override
  List<RecurringNotification> getRecurringNotifications(int interval) {
    if (interval == 1) {
      return localDatabase.getOneMinuteNotifications();
    } else if (interval == 3) {
      return localDatabase.getThreeMinuteNotifications();
    } else if (interval == 5) {
      return localDatabase.getFiveMinuteNotifications();
    } else {
      throw Exception();
    }
  }

  @override
  OneTimeNotification? getSavedNotification(int id) {
    return localDatabase.getSavedNotification(id);
  }
}
