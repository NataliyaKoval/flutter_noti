import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class RemoveNotificationUseCase extends UseCase<void, RemoveNotificationParams> {
  RemoveNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<void> call(RemoveNotificationParams params) async {
    repository.removeNotification(params.id, params.interval);
  }
}

class RemoveNotificationParams {
  const RemoveNotificationParams({
    required this.id,
    this.interval,
  });

  final int id;
  final int? interval;
}
