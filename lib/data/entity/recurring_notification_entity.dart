import 'package:hive_flutter/hive_flutter.dart';
import 'package:noti/domain/models/recurring_notification.dart';

part 'recurring_notification_entity.g.dart';

@HiveType(typeId: 2)
class RecurringNotificationEntity implements RecurringNotification {
  const RecurringNotificationEntity({
    required this.id,
    required this.message,
    this.colorIndex,
    this.iconIdIndex,
  });

  @HiveField(0)
  @override
  final int id;

  @HiveField(1)
  @override
  final String message;

  @HiveField(2)
  @override
  final int? colorIndex;

  @HiveField(3)
  @override
  final int? iconIdIndex;

  factory RecurringNotificationEntity.fromRecurringNotification(
          RecurringNotification notification) =>
      RecurringNotificationEntity(
        id: notification.id,
        message: notification.message,
        colorIndex: notification.colorIndex,
        iconIdIndex: notification.iconIdIndex,
      );
}
