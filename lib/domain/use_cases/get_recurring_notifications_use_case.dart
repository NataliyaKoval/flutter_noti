import 'package:noti/domain/models/recurring_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class GetRecurringNotificationsUseCase
    extends UseCase<List<RecurringNotification>, int> {
  GetRecurringNotificationsUseCase({required this.repository});

  final Repository repository;

  @override
  Future<List<RecurringNotification>> call(int params) async {
    return repository.getOneMinuteNotifications();
  }
}