import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/one_time_notifications_repository.dart';

class GetSavedNotificationUseCase {
  GetSavedNotificationUseCase({required this.oneTimeNotificationsRepository});

  final OneTimeNotificationsRepository oneTimeNotificationsRepository;

  Future<OneTimeNotification?> call(int id) async {
    return oneTimeNotificationsRepository.getSavedNotification(id);
  }
}
