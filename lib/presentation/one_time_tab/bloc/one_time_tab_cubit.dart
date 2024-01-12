import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/use_cases/get_one_time_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_notification_use_case.dart';

part 'one_time_tab_state.dart';

class OneTimeTabCubit extends Cubit<OneTimeTabState> {
  OneTimeTabCubit({
    required this.getOneTimeNotificationsUseCase,
    required this.removeNotificationUseCase,
  }) : super(const OneTimeTabState(list: []));

  final GetOneTimeNotificationsUseCase getOneTimeNotificationsUseCase;
  final RemoveNotificationUseCase removeNotificationUseCase;

  void getOneTimeNotifications() async {
    try {
      List<OneTimeNotification> savedNotifications =
          await getOneTimeNotificationsUseCase();
      List<OneTimeNotification> oldNotifications = List.of(savedNotifications)
        ..removeWhere((element) => element.time.isAfter(DateTime.now()));
      for (var element in oldNotifications) {
        removeOneTimeNotification(element.id);
      }
      List<OneTimeNotification> actualNotifications =
      List.of(savedNotifications)
        ..removeWhere((element) => element.time.isBefore(DateTime.now()));
      emit(state.copyWith(list: actualNotifications));
    } catch (e) {
      print(e);
    }
  }

  void removeOneTimeNotification(int id) {
    removeNotificationUseCase(RemoveNotificationParams(id: id));
    AwesomeNotifications().cancelSchedule(id);
    emit(state.copyWith(
        list: List.of(state.list)..removeWhere((element) => element.id == id)));
  }
}
