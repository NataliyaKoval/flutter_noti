import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/one_time_notifications_repository.dart';

class GetOneTimeNotificationsUseCase {
  GetOneTimeNotificationsUseCase(
      {required this.oneTimeNotificationsRepository});

  final OneTimeNotificationsRepository oneTimeNotificationsRepository;

  Future<List<OneTimeNotification>> call() async {
    return oneTimeNotificationsRepository.getAllNotifications();
  }
}
