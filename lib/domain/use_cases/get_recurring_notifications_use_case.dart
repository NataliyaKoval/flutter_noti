import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/recurring_notifications_repository.dart';

class GetRecurringNotificationsUseCase {
  GetRecurringNotificationsUseCase({required this.recurringNotificationsRepository});

  final RecurringNotificationsRepository recurringNotificationsRepository;

  Future<List<RecurringNotification>> call(int interval) async {
    return recurringNotificationsRepository.getAllNotifications(interval);
  }
}
