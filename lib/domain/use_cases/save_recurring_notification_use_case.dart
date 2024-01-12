import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class SaveRecurringNotificationUseCase
    extends UseCase<void, RecurringNotification> {
  SaveRecurringNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<void> call(RecurringNotification params) async {
    repository.addRecurringNotification(params);
  }
}
