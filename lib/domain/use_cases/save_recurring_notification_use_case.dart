import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class SaveRecurringNotificationUseCase extends UseCase<void, SaveRecurringNotificationParams> {
  SaveRecurringNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<void> call(SaveRecurringNotificationParams params) async {
    if (params.minutesInterval == 1) {
      repository.addOneMinuteNotification(params.notification);
    } else if (params.minutesInterval == 2) {

    } else if (params.minutesInterval == 3) {

    } else {
      //repository.addOneTimeNotification(params.notification);
    }

  }
}

class SaveRecurringNotificationParams {
  final RecurringNotification notification;
  final int minutesInterval;

  const SaveRecurringNotificationParams({
    required this.notification,
    required this.minutesInterval,
  });
}