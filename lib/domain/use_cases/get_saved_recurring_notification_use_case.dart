import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class GetSavedRecurringNotificationUseCase extends UseCase<RecurringNotification?, int> {
  GetSavedRecurringNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<RecurringNotification?> call(int params) async {
    return repository.getSavedRecurringNotification(params);
  }
}