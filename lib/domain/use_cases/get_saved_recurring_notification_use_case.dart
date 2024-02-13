import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/recurring_notifications_repository.dart';

class GetSavedRecurringNotificationUseCase {
  GetSavedRecurringNotificationUseCase({required this.recurringNotificationsRepository});

  final RecurringNotificationsRepository recurringNotificationsRepository;

  Future<RecurringNotification?> call(int id) async {
    return recurringNotificationsRepository.getSavedNotification(id);
  }
}