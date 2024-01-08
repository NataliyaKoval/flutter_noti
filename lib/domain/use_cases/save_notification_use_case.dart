import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class SaveNotificationUseCase extends UseCase<void, OneTimeNotification> {
  SaveNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<void> call(OneTimeNotification params) async {
    repository.addOneTimeNotification(params);
  }
}
