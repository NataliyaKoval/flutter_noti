import 'package:noti/domain/repository/repository.dart';
import 'package:noti/domain/use_cases/use_case.dart';

class RemoveOneTimeNotificationUseCase extends UseCase<void, int> {
RemoveOneTimeNotificationUseCase({required this.repository});

  final Repository repository;

  @override
  Future<void> call(int params) async {
    repository.removeOneTimeNotification(params);
  }
}