import 'package:noti/domain/repository/one_time_notifications_repository.dart';

class RemoveNotificationUseCase {
  RemoveNotificationUseCase({required this.oneTimeNotificationsRepository});

  final OneTimeNotificationsRepository oneTimeNotificationsRepository;

  Future<void> call(int id) async {
    oneTimeNotificationsRepository.removeNotification(id);
  }
}

//Todo: builder
// class RemoveNotificationParams {
//   const RemoveNotificationParams({
//     required this.id,
//     this.interval,
//   });
//
//   final int id;
//   final int? interval;
// }
