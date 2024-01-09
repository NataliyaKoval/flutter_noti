import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class GetOneTimeNotificationsUseCase extends NoParamsUseCase<List<OneTimeNotification>> {
  GetOneTimeNotificationsUseCase({required this.repository});

  final Repository repository;

  @override
  Future<List<OneTimeNotification>> call() async {
    return repository.getOneTimeNotifications();
  }
}
