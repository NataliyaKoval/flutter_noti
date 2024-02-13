import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/recurring_notifications_repository.dart';

class SaveRecurringNotificationUseCase {
  SaveRecurringNotificationUseCase({required this.recurringNotificationsRepository});

  final RecurringNotificationsRepository recurringNotificationsRepository;

  Future<void> call(RecurringNotification notification) async {
    recurringNotificationsRepository.addNotification(notification);
  }
}
