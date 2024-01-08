import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/domain/models/one_time_notification.dart';

part 'one_time_notification_entity.g.dart';

@HiveType(typeId: 1)
class OneTimeNotificationEntity implements OneTimeNotification {
  const OneTimeNotificationEntity({
    required this.id,
    required this.time,
    required this.message,
    this.colorIndex,
    this.iconIdIndex,
  });

  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final DateTime time;

  @HiveField(2)
  @override
  final String message;

  @HiveField(3)
  @override
  final int? colorIndex;

  @HiveField(4)
  @override
  final int? iconIdIndex;

  factory OneTimeNotificationEntity.fromOneTimeNotification(
          OneTimeNotification notification) =>
      OneTimeNotificationEntity(
        id: notification.id,
        time: notification.time,
        message: notification.message,
        colorIndex: notification.colorIndex,
        iconIdIndex: notification.iconIdIndex,
      );
}
