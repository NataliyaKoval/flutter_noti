import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class GetSavedNotificationUseCase extends UseCase<OneTimeNotification?, int> {
  GetSavedNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<OneTimeNotification?> call(int params) async {
    return repository.getSavedNotification(params);
  }
}