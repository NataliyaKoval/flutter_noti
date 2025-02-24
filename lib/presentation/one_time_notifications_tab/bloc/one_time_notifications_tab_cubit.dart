import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti/domain/models/one_time_notification.dart';
import 'package:noti/domain/use_cases/get_one_time_notifications_use_case.dart';
import 'package:noti/domain/use_cases/remove_notification_use_case.dart';

part 'one_time_notifications_tab_state.dart';

class OneTimeNotificationsTabCubit extends Cubit<OneTimeNotificationsTabState> {
  OneTimeNotificationsTabCubit({
    required this.getOneTimeNotificationsUseCase,
    required this.removeNotificationUseCase,
  }) : super(const OneTimeNotificationsTabState(list: []));

  final GetOneTimeNotificationsUseCase getOneTimeNotificationsUseCase;
  final RemoveNotificationUseCase removeNotificationUseCase;

  void getOneTimeNotifications() async {
    try {
      List<OneTimeNotification> savedNotifications =
          await getOneTimeNotificationsUseCase();
      //List<OneTimeNotification>
      Map<bool, List<OneTimeNotification>> mapNotifications =
          List.of(savedNotifications).groupListsBy<bool>(
              (element) => element.time.isAfter(DateTime.now()));
      print(mapNotifications);
      //todo: group methods for 2 lists
      //   ..removeWhere((element) => element.time.isAfter(DateTime.now()));//todo: add comment
      for (var element in mapNotifications[false]!) {
        removeOneTimeNotification(element.id);
      }
      // List<OneTimeNotification> actualNotifications = //todo: upcomingNotif
      //     List.of(savedNotifications)
      //       ..removeWhere((element) => element.time.isBefore(DateTime.now()));
      //emit(state.copyWith(list: actualNotifications));
    } catch (e) {
      print(e);
    }
  }

  void removeOneTimeNotification(int id) {
    removeNotificationUseCase(id); //todo: cancel...
    AwesomeNotifications().cancelSchedule(id);
    emit(state.copyWith(
        list: List.of(state.list)..removeWhere((element) => element.id == id)));
  }
}
