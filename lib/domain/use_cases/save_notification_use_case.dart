import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/one_time_notifications_repository.dart';

class SaveNotificationUseCase {
  SaveNotificationUseCase({required this.oneTimeNotificationsRepository});

  final OneTimeNotificationsRepository oneTimeNotificationsRepository;

  Future<void> call(OneTimeNotification notification) async {
    oneTimeNotificationsRepository.addNotification(notification);
  }
}
