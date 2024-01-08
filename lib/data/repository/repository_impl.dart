import 'package:noti/data/datasources/local_database.dart';
import 'package:noti/data/entity/one_time_notification_entity.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.localDatabase,
  });

  final LocalDatabase localDatabase;

  @override
  Future<void> addOneTimeNotification(
      OneTimeNotification notification) async {
    localDatabase.addOneTimeNotification(
        OneTimeNotificationEntity.fromOneTimeNotification(notification));
  }
}
