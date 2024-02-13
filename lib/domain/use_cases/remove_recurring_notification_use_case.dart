import 'package:noti/domain/repository/recurring_notifications_repository.dart';

class RemoveRecurringNotificationUseCase {
  RemoveRecurringNotificationUseCase({required this.recurringNotificationsRepository});

  final RecurringNotificationsRepository recurringNotificationsRepository;

  Future<void> call(int id) async {
    recurringNotificationsRepository.removeNotification(id);
  }
}